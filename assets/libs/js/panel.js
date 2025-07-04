  document.addEventListener('DOMContentLoaded', function () {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
      new bootstrap.Tooltip(tooltipTriggerEl);
    });
  });




document.getElementById("menuSearchInput").addEventListener("keyup", function () {
    const filter = this.value.toLowerCase();
    const navItems = document.querySelectorAll(".nav-item");

    navItems.forEach(function (item) {
        const link = item.querySelector("a.nav-link");
        const submenu = item.querySelector(".submenu");
        let matchFound = false;

        // Collapse all submenus first
        if (submenu) {
            submenu.classList.remove("show");
        }

        // If no search input, show all items and keep submenus collapsed
        if (filter === "") {
            item.style.display = "block";

            // Reset all submenu item display
            if (submenu) {
                const submenuLinks = submenu.querySelectorAll("a.nav-link");
                submenuLinks.forEach(subLink => {
                    const subItem = subLink.closest(".nav-item");
                    subItem.style.display = "block";
                });
            }

            return; // Skip to next item
        }

        // Check main item match
        if (link && link.textContent.toLowerCase().includes(filter)) {
            matchFound = true;
        }

        // Check submenu matches
        if (submenu) {
            const submenuLinks = submenu.querySelectorAll("a.nav-link");
            let submenuMatch = false;

            submenuLinks.forEach(subLink => {
                const subText = subLink.textContent.toLowerCase();
                const subItem = subLink.closest(".nav-item");

                if (subText.includes(filter)) {
                    submenuMatch = true;
                    matchFound = true;
                    subItem.style.display = "block";
                } else {
                    subItem.style.display = "none";
                }
            });

            if (submenuMatch) {
                submenu.classList.add("show");
            }
        }

        // Show/hide parent item
        item.style.display = matchFound ? "block" : "none";
    });
});


function update_url() {
  // Map protocol options to actual strings
  const protocolMap = {
    '1': 'http://',
    '2': 'http://www.',
    '3': 'https://',
    '4': 'https://www.'
  };

  // Get elements
  const protocolEl = document.getElementById('http');
  const domainEl = document.getElementById('domain');
  const folderEl = document.getElementById('target_folder');
  const insUrlEl = document.getElementById('ins_url');

  // Safely get values or fallback
  const protocol = protocolMap[protocolEl?.value] || '';
  const domain = domainEl?.value?.trim() || '';
  const folder = folderEl?.value?.trim() || '';

  // Compose the URL
  let fullUrl = protocol + domain;
  if (folder !== '') {
    fullUrl += '/' + folder;
  }

  // Update the display
  if (insUrlEl) {
    insUrlEl.textContent = fullUrl;
  }
}

window.addEventListener('DOMContentLoaded', update_url);

document.addEventListener("DOMContentLoaded", function () {
    const view = new URLSearchParams(window.location.search).get("view");
    if (view) {
        const link = document.querySelector(`a[data-toggle="tab"][href="#${view}"]`);
        if (link) {
            link.click(); // trigger Bootstrap tab switch
        }
    }
});

function togglePasswordVisibility() {
  const passwordField = document.getElementById('db_pass');
  const btn = event.target;
  if (passwordField.type === 'password') {
    passwordField.type = 'text';
    btn.textContent = 'Hide';
  } else {
    passwordField.type = 'password';
    btn.textContent = 'Show';
  }
}

function togglePasswordVisibility_name() {
  const input = document.querySelector('[name="db_pass"]');
  if (input.type === "password") {
    input.type = "text";
  } else {
    input.type = "password";
  }
}

function ajaxFormSubmit(event) {
  event.preventDefault();

  const form = event.target;
  const data = new FormData();

  const progressContainer = document.getElementById('progressContainer');
  const progressBar = document.getElementById('progressBar');
  const statusText = document.getElementById('status');

  progressContainer.style.display = 'block';
  statusText.style.display = 'block';
  statusText.className = '';
  statusText.textContent = 'Starting installation...';

  

  try {
if (form.http?.value !== undefined) data.append('http', form.http.value);
  if (form.domain?.value !== undefined) data.append('domain', form.domain.value);
  if (form.target_folder?.value !== undefined) data.append('target_folder', form.target_folder.value);
  if (form.version?.value !== undefined) data.append('version', form.version.value);
  if (form.site_title?.value !== undefined) data.append('site_title', form.site_title.value);
  if (form.site_desc?.value !== undefined) data.append('site_desc', form.site_desc.value);
  if (form.admin_user?.value !== undefined) data.append('admin_user', form.admin_user.value);
  if (form.admin_pass?.value !== undefined) data.append('admin_pass', form.admin_pass.value);
  if (form.admin_email?.value !== undefined) data.append('admin_email', form.admin_email.value);
  if (form.db_host?.value !== undefined) data.append('db_host', form.db_host.value);
  if (form.db_name?.value !== undefined) data.append('db_name', form.db_name.value);
  if (form.db_pass?.value !== undefined) data.append('db_pass', form.db_pass.value);
  if (form.db_user?.value !== undefined) data.append('db_user', form.db_user.value);
  if (form.table_prefix?.value !== undefined) data.append('table_prefix', form.table_prefix.value);

  } catch (error) {
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Form data missing or invalid.';
    progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    progressBar.style.width = '50%';
    return;
  }

  progressBar.style.width = '0%';
 progressBar.className = 'progress-bar progress-bar-striped progress-bar-animated';
  statusText.textContent = 'Installing...';

  const xhr = new XMLHttpRequest();
  xhr.open('POST', actionURL, true);

  // Fake progress animation variables
  let progress = 0;
  const fakeProgressInterval = setInterval(() => {
    progress = Math.min(progress + Math.random() * 10, 95);
    progressBar.style.width = progress + '%';
  }, 500);

  xhr.onload = function () {
    clearInterval(fakeProgressInterval);

    if (xhr.status === 200) {
      try {
        const response = JSON.parse(xhr.responseText);
        if (response.success) {
          progressBar.style.width = '100%';
          progressBar.className = 'progress-bar progress-bar-striped bg-success';
          statusText.className = 'alert alert-success';
          statusText.innerHTML = response.message || 'Installation complete!';
        } else {
          progressBar.style.width = '50%';
         progressBar.className = 'progress-bar progress-bar-striped bg-danger';
          statusText.className = 'alert alert-danger';
          statusText.textContent = response.message || 'Installation failed.';
        }
      } catch (e) {
       progressBar.style.width = '50%';
       progressBar.className = 'progress-bar progress-bar-striped bg-danger';
        statusText.className = 'alert alert-danger';
        statusText.textContent = 'Invalid response format.';
      }
    } else {
      progressBar.style.width = '50%';
      progressBar.className = 'progress-bar progress-bar-striped bg-danger';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Server error: ' + xhr.status;
    }
  };

  xhr.onerror = function () {
    clearInterval(fakeProgressInterval);
   progressBar.style.width = '50%';
   progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Network error. Please try again.';
  };

  xhr.send(data);
}


function ajaxFormSubmit_backup(event) {
  event.preventDefault();

  const form = event.target;
  const data = new FormData();

  const progressContainer = document.getElementById('progressContainer');
  const progressBar = document.getElementById('progressBar');
  const statusText = document.getElementById('status');

  progressContainer.style.display = 'block';
  statusText.style.display = 'block';
  statusText.className = '';
  statusText.textContent = 'Running backup...';

  

  try {
    data.append('backup_dir', form.backup_dir.value);
    data.append('backup_db', form.backup_db.value);
    data.append('target_folder', form.target_folder.value);
    data.append('backup_note', form.backup_note.value);
   
  } catch (error) {
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Form data missing or invalid.';
    progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    progressBar.style.width = '50%';
    return;
  }

  progressBar.style.width = '0%';
 progressBar.className = 'progress-bar progress-bar-striped progress-bar-animated';
  statusText.textContent = 'Backup running...';

  const xhr = new XMLHttpRequest();
  xhr.open('POST', actionURL, true);

  // Fake progress animation variables
  let progress = 0;
  const fakeProgressInterval = setInterval(() => {
    progress = Math.min(progress + Math.random() * 10, 95);
    progressBar.style.width = progress + '%';
  }, 500);

  xhr.onload = function () {
    clearInterval(fakeProgressInterval);

    if (xhr.status === 200) {
      try {
        const response = JSON.parse(xhr.responseText);
        if (response.success) {
          progressBar.style.width = '100%';
          progressBar.className = 'progress-bar progress-bar-striped bg-success';
          statusText.className = 'alert alert-success';
          statusText.innerHTML = response.message || 'Backup complete!';
        } else {
          progressBar.style.width = '50%';
         progressBar.className = 'progress-bar progress-bar-striped bg-danger';
          statusText.className = 'alert alert-danger';
          statusText.textContent = response.message || 'Backup failed.';
        }
      } catch (e) {
       progressBar.style.width = '50%';
       progressBar.className = 'progress-bar progress-bar-striped bg-danger';
        statusText.className = 'alert alert-danger';
        statusText.textContent = 'Invalid response format.';
      }
    } else {
      progressBar.style.width = '50%';
      progressBar.className = 'progress-bar progress-bar-striped bg-danger';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Server error: ' + xhr.status;
    }
  };

  xhr.onerror = function () {
    clearInterval(fakeProgressInterval);
   progressBar.style.width = '50%';
   progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Network error. Please try again.';
  };

  xhr.send(data);
}

document.addEventListener("DOMContentLoaded", function () {
    const view = new URLSearchParams(window.location.search).get("view");
    if (view) {
        const link = document.querySelector(`a[data-toggle="tab"][href="#${view}"]`);
        if (link) {
            link.click(); // trigger Bootstrap tab switch
        }
    }
});


function ajaxFormSubmit_Clone(event) {
  event.preventDefault();

  const form = event.target;
  const data = new FormData();

  const progressContainer = document.getElementById('progressContainer');
  const progressBar = document.getElementById('progressBar');
  const statusText = document.getElementById('status');

  progressContainer.style.display = 'block';
  statusText.style.display = 'block';
  statusText.className = '';
  statusText.textContent = 'Starting'+ view_name+'...';

  

  try {
    data.append('http', form.http.value);
    data.append('domain', form.domain.value);
    data.append('target_folder', form.target_folder.value);
    data.append('id', submit_id);
    data.append('site_title', form.site_title.value);
    data.append('db_host', form.db_host.value);
    data.append('db_name', form.db_name.value);
    data.append('db_pass', form.db_pass.value);
    data.append('db_user', form.db_user.value);
    data.append('table_prefix', form.table_prefix.value);
  } catch (error) {
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Form data missing or invalid.';
    progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    progressBar.style.width = '50%';
    return;
  }

  progressBar.style.width = '0%';
 progressBar.className = 'progress-bar progress-bar-striped progress-bar-animated';
  statusText.textContent = view_name+'...';

  const xhr = new XMLHttpRequest();
  xhr.open('POST', actionURL, true);

  // Fake progress animation variables
  let progress = 0;
  const fakeProgressInterval = setInterval(() => {
    progress = Math.min(progress + Math.random() * 10, 95);
    progressBar.style.width = progress + '%';
  }, 500);

  xhr.onload = function () {
    clearInterval(fakeProgressInterval);

    if (xhr.status === 200) {
      try {
        const response = JSON.parse(xhr.responseText);
        if (response.success) {
          progressBar.style.width = '100%';
          progressBar.className = 'progress-bar progress-bar-striped bg-success';
          statusText.className = 'alert alert-success';
          statusText.innerHTML = response.message || view_name+' complete!';
        } else {
          progressBar.style.width = '50%';
         progressBar.className = 'progress-bar progress-bar-striped bg-danger';
          statusText.className = 'alert alert-danger';
          statusText.textContent = response.message || view_name+' failed.';
        }
      } catch (e) {
       progressBar.style.width = '50%';
       progressBar.className = 'progress-bar progress-bar-striped bg-danger';
        statusText.className = 'alert alert-danger';
        statusText.textContent = 'Invalid response format.';
      }
    } else {
      progressBar.style.width = '50%';
      progressBar.className = 'progress-bar progress-bar-striped bg-danger';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Server error: ' + xhr.status;
    }
  };

  xhr.onerror = function () {
    clearInterval(fakeProgressInterval);
   progressBar.style.width = '50%';
   progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Network error. Please try again.';
  };

  xhr.send(data);
}



function ajaxFormSubmitLive(event) {
  event.preventDefault();

  const form = event.target;
  const data = new FormData();

  const progressContainer = document.getElementById('progressContainer');
  const progressBar = document.getElementById('progressBar');
  const statusText = document.getElementById('status');

  progressContainer.style.display = 'block';
  statusText.style.display = 'block';
  statusText.className = '';
  statusText.textContent = 'Starting'+ view_name+'...';

 

  try {
  
    data.append('id', submit_id);
    data.append('old_db_del', form.old_db_del.value);
    data.append('old_file_del', form.old_file_del.value);
   
  } catch (error) {
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Form data missing or invalid.';
    progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    progressBar.style.width = '50%';
    return;
  }

  progressBar.style.width = '0%';
 progressBar.className = 'progress-bar progress-bar-striped progress-bar-animated';
  statusText.textContent =  view_name+'...';

  const xhr = new XMLHttpRequest();
  xhr.open('POST', actionURL, true);

  // Fake progress animation variables
  let progress = 0;
  const fakeProgressInterval = setInterval(() => {
    progress = Math.min(progress + Math.random() * 10, 95);
    progressBar.style.width = progress + '%';
  }, 500);

  xhr.onload = function () {
    clearInterval(fakeProgressInterval);

    if (xhr.status === 200) {
      try {
        const response = JSON.parse(xhr.responseText);
        if (response.success) {
          progressBar.style.width = '100%';
          progressBar.className = 'progress-bar progress-bar-striped bg-success';
          statusText.className = 'alert alert-success';
          statusText.innerHTML = response.message ||  view_name+' complete!';
        } else {
          progressBar.style.width = '50%';
         progressBar.className = 'progress-bar progress-bar-striped bg-danger';
          statusText.className = 'alert alert-danger';
          statusText.textContent = response.message ||  view_name+' failed.';
        }
      } catch (e) {
       progressBar.style.width = '50%';
       progressBar.className = 'progress-bar progress-bar-striped bg-danger';
        statusText.className = 'alert alert-danger';
        statusText.textContent = 'Invalid response format.';
      }
    } else {
      progressBar.style.width = '50%';
      progressBar.className = 'progress-bar progress-bar-striped bg-danger';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Server error: ' + xhr.status;
    }
  };

  xhr.onerror = function () {
    clearInterval(fakeProgressInterval);
   progressBar.style.width = '50%';
   progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Network error. Please try again.';
  };

  xhr.send(data);
}

function togglePasswordVisibility(button) {
  // Support both togglePasswordVisibility() and togglePasswordVisibility(this)
  if (!button) {
    // Try to get from event
    if (typeof event !== 'undefined' && event.target) {
      button = event.target;
    } else {
      return; // No way to get the button
    }
  }

  const group = button.closest('.input-group');
  let input = group ? group.querySelector('input') : document.getElementById('db_pass');
  if (!input) return;

  if (input.type === 'password') {
    input.type = 'text';
    button.textContent = 'Hide';
  } else {
    input.type = 'password';
    button.textContent = 'Show';
  }
}

function ajaxFormSubmitR(event) {
  event.preventDefault();

  const form = event.target;
  const data = new FormData();

  const progressContainer = document.getElementById('progressContainer');
  const progressBar = document.getElementById('progressBar');
  const statusText = document.getElementById('status');

  progressContainer.style.display = 'block';
  statusText.style.display = 'block';
  statusText.className = '';
  statusText.textContent = 'Running restore backup...';

 

  try {
    data.append('backup_dir', form.backup_dir.value);
    data.append('backup_db', form.backup_db.value);
    data.append('old_file_del', form.old_file_del.value);
    data.append('id', submit_id);
   
  } catch (error) {
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Form data missing or invalid.';
    progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    progressBar.style.width = '50%';
    return;
  }

  progressBar.style.width = '0%';
 progressBar.className = 'progress-bar progress-bar-striped progress-bar-animated';
  statusText.textContent = 'Restore Backup running...';

  const xhr = new XMLHttpRequest();
  xhr.open('POST', actionURL, true);

  // Fake progress animation variables
  let progress = 0;
  const fakeProgressInterval = setInterval(() => {
    progress = Math.min(progress + Math.random() * 10, 95);
    progressBar.style.width = progress + '%';
  }, 500);

  xhr.onload = function () {
    clearInterval(fakeProgressInterval);

    if (xhr.status === 200) {
      try {
        const response = JSON.parse(xhr.responseText);
        if (response.success) {
          progressBar.style.width = '100%';
          progressBar.className = 'progress-bar progress-bar-striped bg-success';
          statusText.className = 'alert alert-success';
          statusText.innerHTML = response.message || 'Restore Backup complete!';
        } else {
          progressBar.style.width = '50%';
         progressBar.className = 'progress-bar progress-bar-striped bg-danger';
          statusText.className = 'alert alert-danger';
          statusText.textContent = response.message || 'Restore Backup failed.';
        }
      } catch (e) {
       progressBar.style.width = '50%';
       progressBar.className = 'progress-bar progress-bar-striped bg-danger';
        statusText.className = 'alert alert-danger';
        statusText.textContent = 'Invalid response format.';
      }
    } else {
      progressBar.style.width = '50%';
      progressBar.className = 'progress-bar progress-bar-striped bg-danger';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Server error: ' + xhr.status;
    }
  };

  xhr.onerror = function () {
    clearInterval(fakeProgressInterval);
   progressBar.style.width = '50%';
   progressBar.className = 'progress-bar progress-bar-striped bg-danger';
    statusText.className = 'alert alert-danger';
    statusText.textContent = 'Network error. Please try again.';
  };

  xhr.send(data);
}


function scan_wp(event) {
  event.preventDefault(); // prevent <a href="#"> reload

  const btn = document.getElementById('scanWpBtn');
  const text = document.getElementById('scanWpText');
  const spinner = document.getElementById('spinnerContainer');

  // Show spinner and disable button
  spinner.style.display = 'flex';
  text.textContent = 'Scanning...';
  btn.classList.add('disabled');

  const data = new FormData();
  data.append('ols_id', '');

  fetch(scan_url, {
    method: 'POST',
    body: data,
  })
    .then(response => response.json())
    .then(result => {
      spinner.style.display = 'none';
      btn.classList.remove('disabled');

      if (result.success) {
  const found = result.new_installations.length;
  text.textContent = `Found ${found} Installation${found > 1 ? 's' : ''}`;
  btn.classList.remove('btn-primary');
  btn.classList.add('btn-success');

  if (found >= 1) {
    setTimeout(() => {
      location.reload();
    }, 2000); // Refresh after 2 seconds
  }
}
 else {
        text.textContent = 'Scan Failed';
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-danger');
        console.error(result.message);
      }
    })
    .catch(err => {
      spinner.style.display = 'none';
      text.textContent = 'Scan Error';
      btn.classList.remove('btn-primary');
      btn.classList.add('btn-danger');
      console.error('Scan error:', err);
    });
}



function togglePluginStatus(el) {
  const slug = el.dataset.slug;
  const ols_id = el.dataset.olsId;
  const newActive = el.checked ? 1 : 0;

  const spinner = document.getElementById('spinner_' + slug);
  if (spinner) spinner.classList.remove('d-none');

  const data = new FormData();
  data.append('slug', slug);
  data.append('active', newActive);
  data.append('ols_id', ols_id);

 

  fetch(actionURL, { method: 'POST', body: data })
    .then(r => r.json())
    .then(resp => {
      if (spinner) spinner.classList.add('d-none');

      if (!resp.success) {
        alert(resp.message || 'Update failed.');
        // rollback checkbox state on failure
        el.checked = !el.checked;
      } else {
        // success — update data-active attribute
        el.dataset.active = newActive.toString();
      }
    })
    .catch(err => {
      if (spinner) spinner.classList.add('d-none');
      alert('Error: ' + err.message);
      // rollback checkbox state on error
      el.checked = !el.checked;
    });
}

function initLazyImages() {
  if ('IntersectionObserver' in window) {
    const lazyImages = document.querySelectorAll('img.lazy');
    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src;
          img.classList.remove('lazy');
          imageObserver.unobserve(img);
        }
      });
    });
    lazyImages.forEach(img => imageObserver.observe(img));
  } else {
    // Fallback for older browsers
    document.querySelectorAll('img.lazy').forEach(img => {
      img.src = img.dataset.src;
      img.classList.remove('lazy');
    });
  }
}

function loadv(table_id, spinner_id, view_name,page="1") { 
  
    var url = baseUrl + "&view=" + encodeURIComponent(view_name) + "&page=" + encodeURIComponent(page);
  const tbody = document.getElementById(table_id);
  const spinner = document.getElementById(spinner_id);
 let searchTerm = '';

if (view_name === 'wordpress_themes_search') {
  searchTerm = document.getElementById('themesSearchInput')?.value.trim() || '';
}else if (view_name === 'my_wp_userlist') {
  searchTerm = document.getElementById('userSearchInput')?.value.trim() || '';
}
else {
  searchTerm = document.getElementById('pluginSearchInput')?.value.trim() || '';
}

  if (!tbody || !spinner || !view_name) {
    console.error('Missing parameters or elements for loadMyPlugins');
    return;
  }

  tbody.dataset.loaded = 'false'; // reset loaded flag if needed
  spinner.style.display = 'block';
  tbody.innerHTML = '';

  // Build the URL dynamically, encode view_name properly for PHP
 
  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams({ search: searchTerm }),
  })
    .then(response => response.text())
    .then(html => {
      tbody.innerHTML = html;
      spinner.style.display = 'none';
      tbody.dataset.loaded = 'true';
      if (typeof initLazyImages === 'function') initLazyImages();
    })
    .catch(err => {
      spinner.style.display = 'none';
      tbody.innerHTML = '<tr><td colspan="4" class="text-danger text-center">Failed to load plugins</td></tr>';
      console.error('Error loading content:', err);
    });
}


function installPlugin(slug) {
  const btn = document.getElementById('installBtn_' + slug);
  if (!btn) return;

 
  const active = 1; // set 1 if you want to activate after install

  btn.disabled = true;
  const originalText = btn.innerText;
  btn.innerText = 'Installing...';

  const data = new FormData();
  data.append('slug', slug);
  data.append('active', active);
  data.append('ols_id', ols_id);

  fetch(plugin_url, {
    method: 'POST',
    body: data,
  })
    .then(response => response.json())
    .then(result => {
      if (result.success) {
        btn.innerText = 'Installed';
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-success');
        btn.disabled = false;
        btn.setAttribute('data-installed', '1');
        btn.setAttribute('data-active', active);
        btn.removeAttribute('onclick');
        loadv('pluginTableBodymy', 'pluginmySpinner', 'my_wp_plugin');
      } else {
        btn.innerText = 'Failed';
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-danger');
        console.error(result.message || 'Plugin installation failed');
      }
    })
    .catch(err => {
      console.error('Install error:', err);
      btn.innerText = 'Error';
      btn.classList.remove('btn-primary');
      btn.classList.add('btn-danger');
    });
}


function installThemes(slug) {
  const btn = document.getElementById('installThemeBtn_' + slug);
  if (!btn) return;

 
  const active = 1; // set 1 if you want to activate after install

  btn.disabled = true;
  const originalText = btn.innerText;
  btn.innerText = 'Installing...';

  const data = new FormData();
  data.append('slug', slug);
  data.append('active', active);
  data.append('ols_id', ols_id);

  fetch(theme_url, {
    method: 'POST',
    body: data,
  })
    .then(response => response.json())
    .then(result => {
      if (result.success) {
        btn.innerText = 'Installed';
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-success');
        btn.disabled = false;
        btn.setAttribute('data-installed', '1');
        btn.setAttribute('data-active', active);
        btn.removeAttribute('onclick');
        loadv('mythemeTableBody', 'mythemeSpinner', 'my_wp_themes');
      } else {
        btn.innerText = 'Failed';
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-danger');
        console.error(result.message || 'Themes installation failed');
      }
    })
    .catch(err => {
      console.error('Install error:', err);
      btn.innerText = 'Error';
      btn.classList.remove('btn-primary');
      btn.classList.add('btn-danger');
    });
}

function toggleThemeStatus(radio) {
  const slug = radio.dataset.slug;
  const ols_id = radio.dataset.olsId;
  const spinner = document.getElementById('spinner_' + slug);

  if (!slug || !ols_id) return;

  spinner?.classList.remove('d-none');

  const data = new FormData();
  data.append('slug', slug);
  data.append('active', 1); // Always 1 since only one theme can be active
  data.append('ols_id', ols_id);


  fetch(actionURLtheme, {
    method: 'POST',
    body: data,
  })
    .then(r => r.json())
    .then(resp => {
      spinner?.classList.add('d-none');
      if (!resp.success) {
       // alert(resp.message || 'Update failed.');
        // Rollback not needed for radio, just reload
      //  window.location.reload();
      } else {
        // Reload to reflect the newly activated theme
       // window.location.reload();
      }
    })
    .catch(err => {
      spinner?.classList.add('d-none');
      alert('Error: ' + err.message);
     // window.location.reload(); // fallback rollback
    });
}

function addUser() {
  const btn = document.getElementById('add_user');
  const statusText = document.getElementById('status');
  if (!btn) return;

  
  btn.disabled = true;
  const originalText = btn.value;
  btn.value = 'Adding...';

  const data = new FormData();
  data.append('ols_id', ols_id);
  data.append('user_login', document.getElementById('user_login').value);
  data.append('user_email', document.getElementById('user_email').value);
  data.append('user_pass', document.getElementById('user_pass').value);
  data.append('first_name', document.getElementById('first_name').value);
  data.append('last_name', document.getElementById('last_name').value);
  data.append('user_url', document.getElementById('user_url').value);
  data.append('role', document.getElementById('role').value);

  fetch(add_user_url, {
    method: 'POST',
    body: data,
  })
    .then(response => response.json())
    .then(result => {
      if (result.success) {
          statusText.style.display = 'block';
           statusText.className = 'alert alert-success';
    statusText.textContent = result.message;
       
        setTimeout(() => {
          btn.value = originalText;
          btn.disabled = false;
          // Clear form
          document.getElementById('user_login').value = '';
          document.getElementById('user_email').value = '';
          document.getElementById('user_pass').value = '';
          document.getElementById('first_name').value = '';
          document.getElementById('last_name').value = '';
          document.getElementById('user_url').value = '';
        }, 2000);
      } else {
          statusText.style.display = 'block';
           statusText.className = 'alert alert-danger';
    statusText.textContent = result.message;
        btn.value = originalText;
          btn.disabled = false;
       
        setTimeout(() => {
          btn.value = originalText;
          btn.disabled = false;
        }, 1000);
      }
    })
    .catch(err => {
        statusText.style.display = 'block';
        statusText.className = 'alert alert-danger';
    statusText.textContent = err;
      btn.value = originalText;
          btn.disabled = false;
      setTimeout(() => {
        btn.value = originalText;
        btn.disabled = false;
      }, 1000);
    });
}


function openUserModal(action, userId) {
  var model_url =`${indexurl}&view=user_modal_${action}&ols_id=${ols_id}&user_id=${userId}`;
  const modalEl = document.getElementById('userModal');
  const body = document.getElementById('userModalBody');
  const label = document.getElementById('userModalLabel');

  label.textContent = action === 'edit' ? 'Edit User' : 'Change Password';
  body.innerHTML = 'Loading...';

  // Create modal instance and store it globally
  userModalInstance = new bootstrap.Modal(modalEl);
  userModalInstance.show();

  fetch(model_url)
    .then(res => res.text())
    .then(html => {
      body.innerHTML = html;
    })
    .catch(err => {
      body.innerHTML = '<div class="text-danger">Failed to load form</div>';
      console.error(err);
    });
}

function dismissModal() {
  if (userModalInstance) {
    userModalInstance.hide();
  }
}

function submitEditUserForm() {
  const form = document.getElementById('editUserForm');
  const formData = new FormData(form);
  const statusText = document.getElementById('fstatus');
if (event) event.preventDefault();
  // Clear any previous status
  statusText.textContent = '';
  statusText.className = '';

  fetch(update_usr_url, {
    method: 'POST',
    body: formData
  })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
          statusText.style.display = 'block';
        statusText.className = 'alert alert-success';
        statusText.textContent = data.message;

        // Close modal after short delay
        setTimeout(() => {
         dismissModal();
          loadv('userTableBody', 'userSpinner', 'my_wp_userlist');
        }, 3000);
      } else {
          statusText.style.display = 'block';
        statusText.className = 'alert alert-danger';
        statusText.textContent = data.message;
      }
    })
    .catch(err => {
        statusText.style.display = 'block';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Error updating user';
      console.error(err);
    });
}

function submitChangePasswordForm() {
  const form = document.getElementById('changePasswordForm');
  const formData = new FormData(form);
  const statusText = document.getElementById('fstatus');
if (event) event.preventDefault();
  // Clear previous status
  statusText.textContent = '';
  statusText.className = '';

  fetch(update_pass_url, {
    method: 'POST',
    body: formData
  })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
          statusText.style.display = 'block';
        statusText.className = 'alert alert-success';
        statusText.textContent = data.message;

        // Close modal after a delay
        setTimeout(() => {
          dismissModal();
          loadv('userTableBody', 'userSpinner', 'my_wp_userlist');
        }, 3000);
      } else {
          statusText.style.display = 'block';
        statusText.className = 'alert alert-danger';
        statusText.textContent = data.message;
      }
    })
    .catch(err => {
        statusText.style.display = 'block';
      statusText.className = 'alert alert-danger';
      statusText.textContent = 'Error updating password';
      console.error(err);
    });
}
