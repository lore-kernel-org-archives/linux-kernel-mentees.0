Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73E3C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 18:00:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C8ED2075F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 18:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/4XxB16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C8ED2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC34E86D64;
	Fri, 25 Sep 2020 18:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9LI12yc_lqn; Fri, 25 Sep 2020 18:00:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 369F586D62;
	Fri, 25 Sep 2020 18:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 200F2C0859;
	Fri, 25 Sep 2020 18:00:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC61C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 18:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F241486E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 18:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7vbyqVAFeJL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 18:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6379686E45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 18:00:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l126so3915329pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/ZTlvcKfwV9W/xONlTPF/fpJtn0pjYTTI1+1eynco68=;
 b=g/4XxB16rWBbvNXQleoZljf+99ldOEc0r3E/SQErOaRPMQC6deft5ywkY++mxKMzIK
 Onc6D9ubAjIU1Ps4UVtrq1XVpHIVql07blYlxgCNNV/m9xYkKDgaJNRHspA4kwY76siZ
 v7yA/ywhmmBle9IhXWGx0Uhz7nAlHMUj8KQThQ+UcyhxtDsQkhNFGUzdMUo4uIPsViIV
 zyBMx8kvtSMCcKBR1DuwUPxLUlTyc11LcW9gNRayWnzcyqNlNjna15O+vtXBdyph7Efo
 PtJEq1IW0Ai/tH4TVGsY1zrAIvw4phM/q/5nAHXTZTdNgzHv0xFuAVBTpwZnGU8+sIv4
 t1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/ZTlvcKfwV9W/xONlTPF/fpJtn0pjYTTI1+1eynco68=;
 b=TuTsG8KNw5balwK4K57F0i+Brtt+NWnGiK+9ilmwi0w/DTJARl07aZbSBlzSsqEaen
 DAP8wrOCCAFHkf/lH8DcheaEtyoVoSHRcGWtjQgKmVYosPMtSrbqzGq3EUmWqdgGNxZp
 vI5jPaHghVH60HNY6IEWz7kUFblqMV6gPdJyUNAm+bFtbgjBFJq/wyS4L2mGW57s/dXI
 pN5iUD3mlmYHgUoyHrL7lF3mRj/L2D8Q4O3SUL3Wcas1q8o/rmP912w564W5exgmTkxt
 V9OE5Gg0aPuMRsdzQ0I9V++iC6oOJIlaH4Yz0w+J35UgrNKYmFaJQcITwLM+h03IapqA
 dqOQ==
X-Gm-Message-State: AOAM531FBa0ReT+M7Mk2r4phCvlA3vpBvOG4GGyDUnNwmIBPKLAQ7QWM
 P9d582cTNaemhZQsy9efcSM=
X-Google-Smtp-Source: ABdhPJzRQCpZNYmwfM15O/4KOgbMCd6nbafo8vLR56x/JR4hpQGq6J4Ia+spVhZ1N6AihMSArI0ztw==
X-Received: by 2002:a17:902:9e95:b029:d2:4276:1ddc with SMTP id
 e21-20020a1709029e95b02900d242761ddcmr558632plq.81.1601056854754; 
 Fri, 25 Sep 2020 11:00:54 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.24])
 by smtp.gmail.com with ESMTPSA id v6sm3411227pfi.38.2020.09.25.11.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 11:00:53 -0700 (PDT)
To: linux-kernel-mentees@lists.linuxfoundation.org
References: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <b7c54f39-976c-644b-a451-83d8d508f0bb@gmail.com>
Date: Fri, 25 Sep 2020 23:30:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Fix uninit-value in
 hci_chan_lookup_handle
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 05/09/20 7:34 am, Anant Thazhemadam wrote:
> When the amount of data stored in the location corresponding to
> iov_iter *from is less then 4, some data seems to go uninitialized.
>
> Updating this condition accordingly, makes sense both intuitively and =

> logically as well, since the other check for extreme condition done is if
> len > HCI_MAX_FRAME_SIZE, which is HCI_MAX_ACL_SIZE (which is 1024) + 4;
> which itself gives some idea about what must be the ideal mininum size.
>
> Reported-and-tested by: syzbot+4c14a8f574461e1c3659@syzkaller.appspotmail=
.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> If there is some explicit reason why len < 4 doesn't work, and only len <=
 2 works, =

> please do let me know.
> The commit message that introduced the initial change =

> (512b2268156a4e15ebf897f9a883bdee153a54b7) wasn't exactly very helpful in=
 this =

> respect, and I couldn't find a whole lot of discussion regarding this eit=
her.
>
>  drivers/bluetooth/hci_vhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
> index 8ab26dec5f6e..0c49821d7b98 100644
> --- a/drivers/bluetooth/hci_vhci.c
> +++ b/drivers/bluetooth/hci_vhci.c
> @@ -159,7 +159,7 @@ static inline ssize_t vhci_get_user(struct vhci_data =
*data,
>  	__u8 pkt_type, opcode;
>  	int ret;
>  =

> -	if (len < 2 || len > HCI_MAX_FRAME_SIZE)
> +	if (len < 4 || len > HCI_MAX_FRAME_SIZE)
>  		return -EINVAL;
>  =

>  	skb =3D bt_skb_alloc(len, GFP_KERNEL);
Hi,

Looks like this patch might have missed the attention of those
who can tell me if this works or why it might not.
For some more context; more details about the bug can be found at
=A0=A0=A0 https://syzkaller.appspot.com/bug?id=3D287b84cc1c834c7878c4193d7b=
18760067f10a77
I should've highlighted that in my initial mail. My apologies.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
