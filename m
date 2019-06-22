From: gregkh at linuxfoundation.org (Greg KH)
Date: Sat, 22 Jun 2019 09:00:23 +0200
Subject: [Linux-kernel-mentees] [PATCH] changes in v2: changed both the
 symbolic permissions S_IFREG and S_IXUGO into octal permissions 0100000 and
 0444 respectively
In-Reply-To: <20190622064900.8830-1-sushmaunnibhavi425@gmail.com>
References: <20190622064900.8830-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190622070023.GA25039@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, Jun 22, 2019 at 12:19:00PM +0530, Sushma Unnibhavi wrote:
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Slow down, take a few hours off, and think about what you are doing
here.  Make a new patch, read the documentation for how to properly
document a versioned patch, and then send it to yourself to ensure you
have it right.

Then if it all looks ok, resend it here to everyone.  There is no rush.
Some of us are about to leave on 10+ plane rides anyway  :)

thanks,

greg k-h
