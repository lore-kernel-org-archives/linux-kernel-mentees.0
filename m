From: corbet at lwn.net (Jonathan Corbet)
Date: Mon, 8 Jul 2019 13:54:04 -0600
Subject: [Linux-kernel-mentees] [PATCH 1/3] Documentation: virtual: Add
	toctree hooks
In-Reply-To: <ef1edb15bd6a6ef87abf4fef7636cd9213450e3c.1562448500.git.lnowakow@eng.ucsd.edu>
References: <cover.1562448500.git.lnowakow@eng.ucsd.edu>
	<ef1edb15bd6a6ef87abf4fef7636cd9213450e3c.1562448500.git.lnowakow@eng.ucsd.edu>
Message-ID: <20190708135404.3eeed68f@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat,  6 Jul 2019 14:38:13 -0700
Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu> wrote:

> From: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> 
> Added toctree hooks for indexing. Hooks added only for newly added files
> or already existing files. 
> 
> The hook for the top of the tree will be added in a later patch series
> when a few more substantial changes have been added. 
> 
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> ---
>  Documentation/virtual/index.rst     | 18 ++++++++++++++++++
>  Documentation/virtual/kvm/index.rst | 12 ++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/virtual/index.rst
>  create mode 100644 Documentation/virtual/kvm/index.rst
> 
> diff --git a/Documentation/virtual/index.rst b/Documentation/virtual/index.rst
> new file mode 100644
> index 000000000000..19c9fa2266f4
> --- /dev/null
> +++ b/Documentation/virtual/index.rst
> @@ -0,0 +1,18 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================
> +Linux Virtual Documentation
> +===========================
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   kvm/index
> +   paravirt_ops
> +
> +.. only:: html and subproject
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/virtual/kvm/index.rst b/Documentation/virtual/kvm/index.rst
> new file mode 100644
> index 000000000000..ada224a511fe
> --- /dev/null
> +++ b/Documentation/virtual/kvm/index.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===
> +KVM
> +===
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   amd-memory-encryption
> +   cpuid
> +   vcpu-requests

At this point in the patch series, the above-mentioned RST files don't
exist.  So if somebody tries to build the docs here, the build will fail.
I suspect that it's pretty rare for people to use bisection with docs
builds, but it's still proper practice to ensure that things work at every
step in your series.  So the above entries should be added in the patches
that convert the files.

Also, vcpu-requests.txt is never touched in this patch series, which
suggests that you didn't build the docs even at the end of it.

Thanks,

jon
