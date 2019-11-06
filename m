Return-Path: <SRS0=n4Lq=Y6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F3DC5DF65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 14:22:42 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2A72178F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 14:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy429A2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2A72178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C975ECDB;
	Wed,  6 Nov 2019 14:22:41 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D05EC3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 14:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C5469196
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 14:22:39 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y24so11496084plr.12
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VZ2YuX9WkVdA2wqZva8TfQh4uDZmSLYmnIZt2JxlnZI=;
	b=iy429A2Ct25xdGd6rSxaImff/6n7BsHMEcJ1elNUhEYMpfsceHyGsLNXGfuTPDayK9
	OFPB5QxinNwR4ztz4fGc0RArA+ldntUVcI17PR4mIv9i9ouOu3OprX0DrvEiucfB3qCe
	ojrGH8Y2Bej9sf4mQc5Zh2KmXMvlI28OK8qX75pVrssia1PGcmimRnnXmalbb7l9ghEF
	aSqhve8jp7NQmQsqhN4U0BZ1UsCxu1GttGQU5Kd7foRsDk3M87j5YFPXTImBlyRdyLPW
	6R37tu0qG1FEROElVWSlVT8h3l2dRpy18ed5l7anPKE2wvGdeGftqxx40ElLgYr6E9Sf
	tiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VZ2YuX9WkVdA2wqZva8TfQh4uDZmSLYmnIZt2JxlnZI=;
	b=eMqCqI5+prtvmXish5dop0qagAC1VdHm/vowbes8WQMZDbPAODdLxEbfNQw6YKXRqP
	tZG0ejWHpW//F6r+bYDoxGq2uNMofIDmQP/h4+MbXVkZQDbO45XrpuMsc5eWNihVchKA
	WcHbVN0fbl+8Q6rQdNvyg2U2MPj0gZbxGvzSJRF0eXnSU5JPVUUPDdvWSwZA15E3CV6r
	X2j+ikLIye1embv3I93GlP+QmdCWOeEGz4m8kJQbZ2jpRwa8yuvTtPTgt6Sj9sarFttW
	aQ1hJ3kQhrTMROr2+0kQVZhLs3K+6bF1n6wkfdqVIP/RccsASWH+CQgF5vaYRI2eR6UJ
	r2rw==
X-Gm-Message-State: APjAAAVCcMPXmxeVifOPP+D05YBeVydGjnm2SAR26rFHQ6TVrVGyUKBQ
	NvzZtJ9MeDbCVRkI92mhCA6iafwGYljUVw==
X-Google-Smtp-Source: APXvYqwW8FePfs310Sjh8MLuZtyWmpxZSQ7ZkwcJbVr51fSef7+NsmDIBarHxe3GMmwrsHrOOTtxEw==
X-Received: by 2002:a17:902:8343:: with SMTP id
	z3mr2920223pln.200.1573050158836; 
	Wed, 06 Nov 2019 06:22:38 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	c184sm26760638pfc.159.2019.11.06.06.22.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Nov 2019 06:22:38 -0800 (PST)
To: Oliver Neukum <oneukum@suse.com>,
	syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
References: <00000000000042d60805933945b5@google.com>
	<20191105233652.21033-1-tranmanphong@gmail.com>
	<1573040577.3090.22.camel@suse.com>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <d6c628d0-71ad-7343-d80e-1b0cd0795242@gmail.com>
Date: Wed, 6 Nov 2019 21:22:34 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573040577.3090.22.camel@suse.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, alex.theissen@me.com, andreyknvl@google.com,
	2pi@mok.nu, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] usb: appledisplay: fix
 use-after-free in bl_get_brightness
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org



On 11/6/19 6:42 PM, Oliver Neukum wrote:
> Am Mittwoch, den 06.11.2019, 06:36 +0700 schrieb Phong Tran:
>> In context of USB disconnect, the delaywork trigger and calling
>> appledisplay_bl_get_brightness() and the msgdata was freed.
>>
>> add the checking return value of usb_control_msg() and only update the
>> data while the retval is valid.
> 
> Hi,
> 
> I am afraid there are some issues with your patch. First, let me stress
> that you found the right place to fix an issue and you partially fixed
> an issue. But the the fix you applied is incomplete and left another
> issue open.
> 
> Your patch still allows doing IO to a device that may already be bound
> to another driver. That is bad, especially as the buffer is already
> free. Yes, if IO is failing, you have fixed that narrow issue.
> But it need not fail.
> 
> If you look into appledisplay_probe() you will see that it can fail
> because backlight_device_register() fails. The error handling will
> thereupon kill the URB and free memory. But it will not kill an already
> scheduled work. The scheduled work will then call usb_control_msg()
> on pdata->msgdata, which has been freed. If that IO fails, all is well.
> If not, the issue still exists.
> 
Hello Oliver,

argee, there need a cancel workqueue in case error of probe().

> Secondly, your error check is off by 2. You are checking only for
> usb_control_msg() failing. But it can return only one byte instead
> of two. If that happens, the value you return is stale, although
> the buffer is correctly allocated.
> 
> 	Regards
> 		Oliver
> 
> The correct fix for both issues would be:
> 
> #syz test: https://github.com/google/kasan.git e0bd8d79
> 
>  From 2497a62bdbeb9bd94f690c22d96dd1b8cf22861f Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Wed, 6 Nov 2019 12:36:28 +0100
> Subject: [PATCH] appledisplay: fix error handling in the scheduled work
> 
> The work item can operate on
> 
> 1. stale memory left over from the last transfer
> the actual length of the data transfered needs to be checked
> 2. memory already freed
> the error handling in appledisplay_probe() needs
> to cancel the work in that case
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/misc/appledisplay.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> index ac92725458b5..ba1eaabc7796 100644
> --- a/drivers/usb/misc/appledisplay.c
> +++ b/drivers/usb/misc/appledisplay.c
> @@ -164,7 +164,12 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
>   		0,
>   		pdata->msgdata, 2,
>   		ACD_USB_TIMEOUT);
> -	brightness = pdata->msgdata[1];
> +	if (retval < 2) {
> +		if (retval >= 0)
> +			retval = -EMSGSIZE;
> +	} else {
> +		brightness = pdata->msgdata[1];
> +	}

compare with message size (2) can be considered.

if (retval == 2) {
	brightness = pdata->msgdata[1];
} else {
	retval = -EMSGSIZE;
}

Regards,
Phong.

>   	mutex_unlock(&pdata->sysfslock);
>   
>   	if (retval < 0)
> @@ -299,6 +304,7 @@ static int appledisplay_probe(struct usb_interface *iface,
>   	if (pdata) {
>   		if (pdata->urb) {
>   			usb_kill_urb(pdata->urb);
> +			cancel_delayed_work_sync(&pdata->work);
>   			if (pdata->urbdata)
>   				usb_free_coherent(pdata->udev, ACD_URB_BUFFER_LEN,
>   					pdata->urbdata, pdata->urb->transfer_dma);
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
