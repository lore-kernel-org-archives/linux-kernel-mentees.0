Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940D2F9D82
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449828; cv=none; b=oklfSgNl72br5IjpYNBtfi23vtW7rpgOpxy4LqtKcHjQn4kmOvapvxnzrnb8U6r+fkiZ/ZXBuhnpUuFt759c2Mj6HasF+SElmgHsjRv0SUW38b58/HibQnGb0NNeLAB66wEeT3UVymwwbXczvHOFwdU+bZKyV/onG7SyvfQoM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449828; c=relaxed/simple;
	bh=5O9J6kb476wy6tFSq9knVGHMfsEvnpv6aOLBIYkoiNM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=u4txRh9iHQ+MvU7YVUYleAOSTmH/Fa4hIY+p1RxVmAHwD87vpLp+oQ1H6sKqj7tnzo4rR650OJeoitP1SA3UGUICEJ/5Ughqoj9/eE/FUEbcth81QqvMNnxuTmTMG0oW1DQpmsDz1qYaXhBuDRWMzBz05pQLyj5IM0+OIs3OFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMgh5zNG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMgh5zNG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29586626fbeso54474295ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763449826; x=1764054626; darn=lists.linux.dev;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RrKPP6z7wU/aXqA253p15IW0r2BB9sLLeqZrFgeML4=;
        b=XMgh5zNG3u3HxRK/KyzUobSpmu6wuHnTXQByU3OQaP95+RNYqXwR4I9lkuTgBu/Bz4
         SdLwgG1vCQw0CVV0d4UcohrGG9WwV9DYcLGiHV/bk2+tIRaJ4yKrySaHJxAoDOb96ZrL
         TI9vf2QULicBbzevW0pac5SvqxuTT28c0DW1edeKlnOG1yTMMzrXLH1MbCN76PyZUXP7
         tRBbQUdJ0O9sMkiq9xicEpRgCuJ82osDvmKd9Du3P1G4OdJf1d5k8Ih2caf8ATaQC9HS
         qherqQSyOo1SiErFU8Dmf9i2fEWQqI0Rcqm2gFvMwy83uJhtk94+0YQw/jMsP7x3354P
         hVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449826; x=1764054626;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RrKPP6z7wU/aXqA253p15IW0r2BB9sLLeqZrFgeML4=;
        b=qXyTAWCRpOW23gNragWCKOewW/6+08oLd4NAuwLtD2malva9/iBwaH+1xIRHVrvda0
         zkME/4osmbORs9/BUduhUznAghdBY4LAHODDnjMO6a4tGZ1SpRBNwaBk4QJu3lWQ6D8R
         hWfWcN+aVI8qlr/lcRXqfcOF2lBwe4Lw9eV7Gtq33bMBzP47a9WhOZgzkq9HM4m8Ie6e
         rRgYlqr8KazcU0nY8E+TIeoN3OBFrw0Zjl8iWnIoTQ0y0KSIDX0b1y3OYZvKq6oHO1g2
         q1ERHC+H7NfagJjqLdp6Pck6oUGXQqqHcK+DN0SupT8aAwDigXN8mhbBwWFUKgcY29qO
         9DdA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvLx6fK/W2mgSsPtWUXlPO87beU34P8uyWxusmLRQ+gMpVpjBgawddI60SSv6/piur02XyE192fRd58YqtDPMkltO0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz12JasGKGSlOVoDxl+wFoFGuN/l1URY3ZvDWHVTgs7C9dQ+fCS
	8N1vIujHRQbTBoiD8l6YU2Hlnf0NO7b/Xw/m9LxyouXWudk800drNakg
X-Gm-Gg: ASbGncs74NfOdMoUTvn1VGqqWybHN3UOAPksBUu0ok/0q25ST7Kzv9vDaoFJ4G68gnM
	IIPCwN1afnF6coTuB5qn+TeJAYoGZ/4qMHEE6A5NmH/R33iM2mtLRqrMOfKp/ofUR2QFC/rA3lA
	tpGmg9V+KWKD91DHxA3U6jUYEG/bmnSh2Rxfg00A96U+BzrIy0y67PmNtPVCXk9tySi0HOXAnFv
	9lv2HCYzlifB3wUvl9j2qINBJ2Ecd17n5EUUmZQ/Cr+CJhNReZBQnn2y/Skd7TgG1aZCgHijdXs
	8gzmi9ncXmkFX1YZy3Sd6Gl+5DFiv/2lMshG4BaxxbhcKfNfyv+BVsJgNQciy+UnqF5h+CfuUmZ
	KjoOiIWxcXu50fUl0ahHwhed7ArDwwJvtOn5yQUPc0l/XwnbrT71ZB6RfMcUIZpIGSWtruBY2BA
	TXjSIqnqoP0CKE8BrSNjNxQCmO26G4ibwGxcJI1R3eG4o1buEdoaCDDC8=
X-Google-Smtp-Source: AGHT+IHUGeyz8PbVxowr8o/Q+NUhJTHJfWkN1HhW18AL2Jd5L8B99Kv+Dj50R9G61zWEcO/nOBHX3g==
X-Received: by 2002:a17:902:ef45:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-2986a73bab2mr172368915ad.34.1763449825953;
        Mon, 17 Nov 2025 23:10:25 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-299daf12fe9sm68927625ad.74.2025.11.17.23.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:10:25 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------IGfTg4SY1Onlb2vFZARdg2gO"
Message-ID: <93a1773e-e30a-469d-bc8f-029773112401@gmail.com>
Date: Tue, 18 Nov 2025 15:10:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] loop: don't change loop device under exclusive opener in
 loop_set_status
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, jack@suse.cz,
 cascardo@igalia.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org,
 syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
 Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251114144204.2402336-2-rpthibeault@gmail.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251114144204.2402336-2-rpthibeault@gmail.com>

This is a multi-part message in MIME format.
--------------IGfTg4SY1Onlb2vFZARdg2gO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 22:42, Raphael Pinsonneault-Thibeault wrote:
> loop_set_status() is allowed to change the loop device while there
> are other openers of the device, even exclusive ones.
> 
> In this case, it causes a KASAN: slab-out-of-bounds Read in
> ext4_search_dir(), since when looking for an entry in an inlined
> directory, e_value_offs is changed underneath the filesystem by
> loop_set_status().
> 
> Fix the problem by forbidding loop_set_status() from modifying the loop
> device while there are exclusive openers of the device. This is similar
> to the fix in loop_configure() by commit 33ec3e53e7b1 ("loop: Don't
> change loop device under exclusive opener") alongside commit ecbe6bc0003b
> ("block: use bd_prepare_to_claim directly in the loop driver").
> 
> Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
> Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
> ---
> ML thread for previous, misguided patch idea:
> https://lore.kernel.org/all/20251112185712.2031993-2-rpthibeault@gmail.com/t/
> 
>   drivers/block/loop.c | 41 ++++++++++++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 053a086d547e..756ee682e767 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1222,13 +1222,24 @@ static int loop_clr_fd(struct loop_device *lo)
>   }
>   
>   static int
> -loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
> +loop_set_status(struct loop_device *lo, blk_mode_t mode,
> +		struct block_device *bdev, const struct loop_info64 *info)
>   {
>   	int err;
>   	bool partscan = false;
>   	bool size_changed = false;
>   	unsigned int memflags;
>   
> +	/*
> +	 * If we don't hold exclusive handle for the device, upgrade to it
> +	 * here to avoid changing device under exclusive owner.
> +	 */
> +	if (!(mode & BLK_OPEN_EXCL)) {
> +		err = bd_prepare_to_claim(bdev, loop_set_status, NULL);
> +		if (err)
> +			goto out_reread_partitions;
> +	}
> +

+	if (mode & BLK_OPEN_EXCL) {
+               struct block_device *whole = bdev_whole(bdev);
+
+               BUG_ON(whole->bd_claiming == NULL);
+       }

I add the above code and do the following test:
# losetup -f data.1g
# echo "0 `blockdev --getsz /dev/loop0` linear /dev/loop0 0" | dmsetup
create my-linear
# ./ioctl-test /dev/mapper/my-linear // trigger BUG_ON, ioctl-test.c is
in attachment.

The root causes of BUG_ON:
1. When creating 'my-linear' device, the mode for opening /dev/loop0
does not include the BLK_OPEN_EXCL flag.
table_load
  - dm_table_create // get_mode() never assign BLK_OPEN_EXCL to {struct
dm_table *t}->mode
  - populate_table
   - dm_table_add_target
    - linear_ctr
     - dm_get_device // mode = {struct dm_table *t}->mode, never open
loop0 with BLK_OPEN_EXCL mode.

2. When 'my-linear' device is opened with the O_EXCL flag, and an ioctl
is issued to it. The dm_blk_ioctl function calls bdev->bd_disk->fops-
> ioctl(bdev, mode, cmd, arg), which passes the mode with BLK_OPEN_EXCL
flag to lo_ioctl.

3. loop0 was not opened by dm_get_device() in BLK_OPEN_EXCL mode. As a
result, whole->bd_claiming is NULL.

Thus, the BLK_OPEN_EXCL flag in the mode passed to lo_ioctl doesn't
guarantee the loop device was opened with BLK_OPEN_EXCL.

How about use per-device rw_semaphore instead of 'bd_prepare_to_claim/
bd_abort_claiming'?

Yongpeng,

>   	err = mutex_lock_killable(&lo->lo_mutex);
>   	if (err)
>   		return err;
> @@ -1270,6 +1281,9 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>   	}
>   out_unlock:
>   	mutex_unlock(&lo->lo_mutex);
> +	if (!(mode & BLK_OPEN_EXCL))
> +		bd_abort_claiming(bdev, loop_set_status);
> +out_reread_partitions:
>   	if (partscan)
>   		loop_reread_partitions(lo);
>   
> @@ -1349,7 +1363,9 @@ loop_info64_to_old(const struct loop_info64 *info64, struct loop_info *info)
>   }
>   
>   static int
> -loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
> +loop_set_status_old(struct loop_device *lo, blk_mode_t mode,
> +		    struct block_device *bdev,
> +		    const struct loop_info __user *arg)
>   {
>   	struct loop_info info;
>   	struct loop_info64 info64;
> @@ -1357,17 +1373,19 @@ loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
>   	if (copy_from_user(&info, arg, sizeof (struct loop_info)))
>   		return -EFAULT;
>   	loop_info64_from_old(&info, &info64);
> -	return loop_set_status(lo, &info64);
> +	return loop_set_status(lo, mode, bdev, &info64);
>   }
>   
>   static int
> -loop_set_status64(struct loop_device *lo, const struct loop_info64 __user *arg)
> +loop_set_status64(struct loop_device *lo, blk_mode_t mode,
> +		  struct block_device *bdev,
> +		  const struct loop_info64 __user *arg)
>   {
>   	struct loop_info64 info64;
>   
>   	if (copy_from_user(&info64, arg, sizeof (struct loop_info64)))
>   		return -EFAULT;
> -	return loop_set_status(lo, &info64);
> +	return loop_set_status(lo, mode, bdev, &info64);
>   }
>   
>   static int
> @@ -1546,14 +1564,14 @@ static int lo_ioctl(struct block_device *bdev, blk_mode_t mode,
>   	case LOOP_SET_STATUS:
>   		err = -EPERM;
>   		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
> -			err = loop_set_status_old(lo, argp);
> +			err = loop_set_status_old(lo, mode, bdev, argp);
>   		break;
>   	case LOOP_GET_STATUS:
>   		return loop_get_status_old(lo, argp);
>   	case LOOP_SET_STATUS64:
>   		err = -EPERM;
>   		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
> -			err = loop_set_status64(lo, argp);
> +			err = loop_set_status64(lo, mode, bdev, argp);
>   		break;
>   	case LOOP_GET_STATUS64:
>   		return loop_get_status64(lo, argp);
> @@ -1647,8 +1665,9 @@ loop_info64_to_compat(const struct loop_info64 *info64,
>   }
>   
>   static int
> -loop_set_status_compat(struct loop_device *lo,
> -		       const struct compat_loop_info __user *arg)
> +loop_set_status_compat(struct loop_device *lo, blk_mode_t mode,
> +		    struct block_device *bdev,
> +		    const struct compat_loop_info __user *arg)
>   {
>   	struct loop_info64 info64;
>   	int ret;
> @@ -1656,7 +1675,7 @@ loop_set_status_compat(struct loop_device *lo,
>   	ret = loop_info64_from_compat(arg, &info64);
>   	if (ret < 0)
>   		return ret;
> -	return loop_set_status(lo, &info64);
> +	return loop_set_status(lo, mode, bdev, &info64);
>   }
>   
>   static int
> @@ -1682,7 +1701,7 @@ static int lo_compat_ioctl(struct block_device *bdev, blk_mode_t mode,
>   
>   	switch(cmd) {
>   	case LOOP_SET_STATUS:
> -		err = loop_set_status_compat(lo,
> +		err = loop_set_status_compat(lo, mode, bdev,
>   			     (const struct compat_loop_info __user *)arg);
>   		break;
>   	case LOOP_GET_STATUS:

--------------IGfTg4SY1Onlb2vFZARdg2gO
Content-Type: text/x-csrc; charset=UTF-8; name="ioctl-test.c"
Content-Disposition: attachment; filename="ioctl-test.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPGZjbnRs
Lmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVk
ZSA8bGludXgvZnMuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4K
I2luY2x1ZGUgPGxpbnV4L2xvb3AuaD4KCmludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2
W10pCnsKICAgIGlmIChhcmdjICE9IDIpIHsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIlVz
YWdlOiAlcyBbZGV2IHBhdGhdXG4iLCBhcmd2WzBdKTsKICAgICAgICByZXR1cm4gMTsKICAg
IH0KCiAgICBjb25zdCBjaGFyICpkZXYgPSBhcmd2WzFdOwogICAgc3RydWN0IGxvb3BfaW5m
bzY0IGluZm87CiAgICBtZW1zZXQoJmluZm8sIDAsIHNpemVvZihpbmZvKSk7CgogICAgaW50
IGZkID0gb3BlbihkZXYsIE9fUkRXUiB8IE9fRVhDTCk7CiAgICBpZiAoZmQgPCAwKSB7CiAg
ICAgICAgZnByaW50ZihzdGRlcnIsICJGYWlsZWQgdG8gb3BlbiAlcyBleGNsdXNpdmVseTog
JXNcbiIsCiAgICAgICAgICAgICAgICBkZXYsIHN0cmVycm9yKGVycm5vKSk7CiAgICAgICAg
cmV0dXJuIDE7CiAgICB9CgogICAgaWYgKGlvY3RsKGZkLCBMT09QX1NFVF9TVEFUVVM2NCwg
JmluZm8pID09IC0xKSB7CiAgICAgICAgcGVycm9yKCJpb2N0bCBlcnJvciIpOwogICAgICAg
IGNsb3NlKGZkKTsKICAgICAgICByZXR1cm4gMTsKICAgIH0KCiAgICBjbG9zZShmZCk7CiAg
ICByZXR1cm4gMDsKfQo=

--------------IGfTg4SY1Onlb2vFZARdg2gO--
