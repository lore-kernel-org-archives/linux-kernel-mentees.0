From: corbet at lwn.net (Jonathan Corbet)
Date: Mon, 8 Jul 2019 07:52:55 -0600
Subject: [Linux-kernel-mentees] [PATCH] Documentation: usb: convert
	usb-help to rst
In-Reply-To: <20190705185519.31033-1-tranmanphong@gmail.com>
References: <20190705185519.31033-1-tranmanphong@gmail.com>
Message-ID: <20190708075255.0f337b28@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat,  6 Jul 2019 01:55:19 +0700
Phong Tran <tranmanphong at gmail.com> wrote:

> Add new index.rst and change usb-help.txt format
> to rst.
> 
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>

Thank you for working to make the kernel's documentation better.  That
said, I really don't think there is value in keeping this document.  It
hasn't been updated in any useful way in decades, contains broken links,
and the links that still work are full of obsolete information.  Honestly,
a better patch would, IMO, just delete this file.

Thanks,

jon
