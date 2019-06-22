From: gregkh at linuxfoundation.org (Greg KH)
Date: Sat, 22 Jun 2019 08:28:15 +0200
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8732bs: replace
 symbolic permission with octal permission
In-Reply-To: <20190622053358.5832-1-sushmaunnibhavi425@gmail.com>
References: <20190622053358.5832-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190622062815.GA6089@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, Jun 22, 2019 at 11:03:58AM +0530, Sushma Unnibhavi wrote:
> Resolved following checkpatch issue:
> WARNING: Symbolic permissions 'S_IXUGO' are not preferred. Consider using octal permissions '0111'
> 
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Is this a "v2" patch?  If so, you always have to say that as per the
kernel documentation and put what changed below the --- line.

Also, you can not send patches based on top of a previous patch, unless
that patch was accepted.  And I don't think I accepted your previous
patch, right?

thanks,

greg k-h
