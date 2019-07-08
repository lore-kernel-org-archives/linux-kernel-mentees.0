From: corbet@lwn.net (Jonathan Corbet)
Date: Mon, 8 Jul 2019 14:00:22 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/3] Documentation: kvm: Convert
	cpuid.txt to .rst
In-Reply-To: <e8cd24f40cdd23ed116679f4c3cfcf8849879bb4.1562448500.git.lnowakow@eng.ucsd.edu>
References: <cover.1562448500.git.lnowakow@eng.ucsd.edu>
	<e8cd24f40cdd23ed116679f4c3cfcf8849879bb4.1562448500.git.lnowakow@eng.ucsd.edu>
Message-ID: <20190708140022.5fa9d01f@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708200022.85nTMztLdMZJ2aoYgNhGkxjs1PDehCAz6kCE3ZwBRE8@z>

On Sat,  6 Jul 2019 14:38:14 -0700
Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu> wrote:

> From: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> 
> Convert cpuid.txt to .rst format to be parsable by sphinx. 
> 
> Change format and spacing to make function definitions and return values
> much more clear. Also added a table that is parsable by sphinx and makes
> the information much more clean. 
> 
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> ---
>  Documentation/virtual/kvm/cpuid.rst | 99 +++++++++++++++++++++++++++++
>  Documentation/virtual/kvm/cpuid.txt | 83 ------------------------
>  2 files changed, 99 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/virtual/kvm/cpuid.rst
>  delete mode 100644 Documentation/virtual/kvm/cpuid.txt
> 
> diff --git a/Documentation/virtual/kvm/cpuid.rst b/Documentation/virtual/kvm/cpuid.rst
> new file mode 100644
> index 000000000000..1a03336a500e
> --- /dev/null
> +++ b/Documentation/virtual/kvm/cpuid.rst
> @@ -0,0 +1,99 @@
> +.. SPDX-License-Identifier: GPL-2.0

Do you know that this is the appropriate license for this file?  If so, you
should say how you know that.  I appreciate that you thought to add the
SPDX line, but we have to be sure that it actually matches the intent of
the creator of this file.

> +==============
> +KVM CPUID bits
> +==============
> +
> +:Author: Glauber Costa <glommer at redhat.com>, Red Hat Inc, 2010

I rather suspect that email address doesn't work these days.

> +A guest running on a kvm host, can check some of its features using
> +cpuid. This is not always guaranteed to work, since userspace can
> +mask-out some, or even all KVM-related cpuid features before launching
> +a guest.
> +
> +KVM cpuid functions are:
> +
> +function: **KVM_CPUID_SIGNATURE (0x40000000)**

I wouldn't add the **markup** here, it doesn't really help.

> +
> +returns::
> + 
> +   eax = 0x40000001
> +   ebx = 0x4b4d564b
> +   ecx = 0x564b4d56
> +   edx = 0x4d
> +
> +Note that this value in ebx, ecx and edx corresponds to the string "KVMKVMKVM".
> +The value in eax corresponds to the maximum cpuid function present in this leaf,
> +and will be updated if more functions are added in the future.
> +Note also that old hosts set eax value to 0x0. This should
> +be interpreted as if the value was 0x40000001.
> +This function queries the presence of KVM cpuid leafs.
> +
> +function: **define KVM_CPUID_FEATURES (0x40000001)**
> +
> +returns::
> +
> +          ebx, ecx
> +          eax = an OR'ed group of (1 << flag)
> +
> +where ``flag`` is defined as below:
> +
> ++--------------------------------+------------+---------------------------------+
> +| flag                           | value      | meaning                         |
> ++================================+============+=================================+
> +| KVM_FEATURE_CLOCKSOURCE        | 0          | kvmclock available at msrs      |
> +|                                |            | 0x11 and 0x12                   |

You might consider using the

    ======= ===== ======
    simpler table format
    ======= ===== ======

here, it might be a bit easier to read and maintain.

Thanks,

jon
