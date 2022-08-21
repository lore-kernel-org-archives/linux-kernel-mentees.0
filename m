Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE27DC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 11:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF35404F8;
	Sun, 21 Aug 2022 11:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF35404F8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=VQ5XJJ8w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wd6Wo7GLv6sb; Sun, 21 Aug 2022 11:23:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DD107400E5;
	Sun, 21 Aug 2022 11:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD107400E5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B57D6C0033;
	Sun, 21 Aug 2022 11:23:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FBEBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 11:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F984099D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 11:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F984099D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=VQ5XJJ8w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2twqo-1FsbCK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 11:23:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286C3404F0
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286C3404F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 11:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1661081023; cv=none; d=zohomail.in; s=zohoarc; 
 b=KrvlIXm5rXYXzjoMOrRcze4AuXywl1HjEMsZdJHrF4+7zwLhJvirZTC/tBLjnSgMkVKFLY/LkoD/2pLHvZWtcfw2hZIBTGSh3Hg3+TLVKFJ2tHkhtjfM1QOHCxn8qqFs/HuRmW/cyH+4dUMvPLUwfAk8gwzDpn+yzT8h5/LgnVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1661081023;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=pr6XFxAuncNUkzN57qnmmA5GV4O8hBAFG8BalqlNToE=; 
 b=Q71/PCc8syQqMKA+huSNVq6174D0RXliurjzRQOAvfXDimwG1r2kgyiJkg+PG6nM2DptfxhxcmNJyXsDWvUbpScKAljw3O9VSAR47B4IS1r5wKxEUv1RuTfRdYpYdnPjUz8tMEePz+nZhPwSGaY7aEMeMSYi19tvjs22c5S6tu4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661081023; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pr6XFxAuncNUkzN57qnmmA5GV4O8hBAFG8BalqlNToE=;
 b=VQ5XJJ8w/9MlHjbsTrtMPmKurHKIxT/lFYcRNKLAKtJM2ZIFFTdzC/A5sbueQLkA
 JWFj9QJ7z6PlLLeGTPGx/2o21cwCkn4EGNYWVGvRBPuVjxDEkGb7VrCkfBcR2eVK9Ok
 Q8+q6RFw8fw2iMYi6hxxKh5tAgheVE/ShGrvUZFA=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1661081012485618.1064345682378;
 Sun, 21 Aug 2022 16:53:32 +0530 (IST)
Date: Sun, 21 Aug 2022 16:53:32 +0530
To: "Jens Axboe" <axboe@kernel.dk>, "Carlos Llamas" <cmllamas@google.com>
Message-ID: <182c024c8f1.2e77843173026.4408233265123165366@siddh.me>
In-Reply-To: <20220820114105.8792-1-code@siddh.me>
References: <20220820114105.8792-1-code@siddh.me>
Subject: Re: [PATCH] loop: Correct UAPI definitions to match with driver
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-block <linux-block@vger.kernel.org>, stable <stable@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+a8e049cd3abd342936b6
 <syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 20 Aug 2022 17:11:05 +0530  Siddh Raman Pant  wrote:
> Syzkaller has reported a warning in iomap_iter(), which got
> triggered due to a call to iomap_iter_done() which has:
> 	WARN_ON_ONCE(iter->iomap.offset > iter->pos);
> 
> The warning was triggered because `pos` was being negative.
> I was having offset = 0, pos = -2950420705881096192.
> 
> This ridiculously negative value smells of an overflow, and sure
> it is.
> 
> The userspace can configure a loop using an ioctl call, wherein
> a configuration of type loop_config is passed (see lo_ioctl()'s
> case on line 1550 of drivers/block/loop.c). This proceeds to call
> loop_configure() which in turn calls loop_set_status_from_info()
> (see line 1050 of loop.c), passing &config->info which is of type
> loop_info64*. This function then sets the appropriate values, like
> the offset.
> 
> The problem here is loop_device has lo_offset of type loff_t
> (see line 52 of loop.c), which is typdef-chained to long long,
> whereas loop_info64 has lo_offset of type __u64 (see line 56 of
> include/uapi/linux/loop.h).
> 
> The function directly copies offset from info to the device as
> follows (See line 980 of loop.c):
> 	lo->lo_offset = info->lo_offset;
> 
> This results in the encountered overflow (in my case, the RHS
> was 15496323367828455424).
> 
> Thus, convert the type definitions in loop_info64 to their
> signed counterparts in order to match definitions in loop_device,
> and check for negative value during loop_set_status_from_info().
> 
> Bug report: https://syzkaller.appspot.com/bug?id=c620fe14aac810396d3c3edc9ad73848bf69a29e
> Reported-and-tested-by: syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddh Raman Pant code@siddh.me>
> ---
> Unless I am missing any other uses or quirks of UAPI loop_info64,
> I think this won't introduce regression, since if something is
> working, it will continue to work. If something does break, then
> it was relying on overflows, which is anyways an incorrect way
> to go about.
> 
> Also, it seems even the 32-bit compatibility structure uses the
> signed types (compat_loop_info uses compat_int_t which is s32),
> so this patch should be fine.
> 
>  drivers/block/loop.c      |  3 +++
>  include/uapi/linux/loop.h | 12 ++++++------
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index e3c0ba93c1a3..4ca20ce3158d 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -977,6 +977,9 @@ loop_set_status_from_info(struct loop_device *lo,
>  		return -EINVAL;
>  	}
>  
> +	if (info->lo_offset lo_sizelimit < 0)
> +		return -EINVAL;
> +
>  	lo->lo_offset = info->lo_offset;
>  	lo->lo_sizelimit = info->lo_sizelimit;
>  	memcpy(lo->lo_file_name, info->lo_file_name, LO_NAME_SIZE);
> diff --git a/include/uapi/linux/loop.h b/include/uapi/linux/loop.h
> index 6f63527dd2ed..973565f38f9d 100644
> --- a/include/uapi/linux/loop.h
> +++ b/include/uapi/linux/loop.h
> @@ -53,12 +53,12 @@ struct loop_info64 {
>  	__u64		   lo_device;			/* ioctl r/o */
>  	__u64		   lo_inode;			/* ioctl r/o */
>  	__u64		   lo_rdevice;			/* ioctl r/o */
> -	__u64		   lo_offset;
> -	__u64		   lo_sizelimit;/* bytes, 0 == max available */
> -	__u32		   lo_number;			/* ioctl r/o */
> -	__u32		   lo_encrypt_type;		/* obsolete, ignored */
> -	__u32		   lo_encrypt_key_size;		/* ioctl w/o */
> -	__u32		   lo_flags;
> +	__s64		   lo_offset;
> +	__s64		   lo_sizelimit;/* bytes, 0 == max available */
> +	__s32		   lo_number;			/* ioctl r/o */
> +	__s32		   lo_encrypt_type;		/* obsolete, ignored */
> +	__s32		   lo_encrypt_key_size;		/* ioctl w/o */
> +	__s32		   lo_flags;
>  	__u8		   lo_file_name[LO_NAME_SIZE];
>  	__u8		   lo_crypt_name[LO_NAME_SIZE];
>  	__u8		   lo_encrypt_key[LO_KEY_SIZE]; /* ioctl w/o */
> -- 
> 2.35.1

There has been discussion on syzkaller mailing list:
https://groups.google.com/g/syzkaller-bugs/c/bg3ANn_7oJw/m/-MbtBx9cAwAJ

Reproducing the latest reply:

On Sun, 21 Aug 2022 11:59:05 +0530  Christoph Hellwig  wrote:
> On Thu, Aug 18, 2022 at 08:51:16PM +0530, Siddh Raman Pant wrote:
> > On Thu, 18 Aug 2022 20:20:02 +0530  Matthew Wilcox  wrote:
> > > I don't think changing these from u64 to s64 is the right way to go.
> > 
> > Why do you think so? Is there somnething I overlooked?
> > 
> > I think it won't intorduce regression, since if something is working,
> > it will continue to work. If something does break, then they were
> > relying on overflows, which is anyways an incorrect way to go about.
> 
> Well, for example userspace code expecting unsignedness of these
> types could break.  So if we really think changing the types is so
> much preferred we'd need to audit common userspace first.  Because
> of that I think the version proposed by willy is generally preferred.
>
> > Also, it seems even the 32-bit compatibility structure uses signed
> > types.
> 
> We should probably fix that as well.

Thus, I will send a v2 once the discussion is resolved.

I had sent this patch because the discussion was stale for 2 days and
Matthew seemed to be active on other email threads.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
