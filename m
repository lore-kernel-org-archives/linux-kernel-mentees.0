Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C113C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 17:48:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E6822475
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 17:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDOJ/GnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E6822475
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 638C38714A;
	Sat, 10 Oct 2020 17:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzUdRAxo-NTH; Sat, 10 Oct 2020 17:48:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4F3587124;
	Sat, 10 Oct 2020 17:48:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CAD0C016F;
	Sat, 10 Oct 2020 17:48:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5378C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBDFB87231
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 17:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7O2PaT2JOmv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 17:48:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4028787220
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 17:48:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e10so9720087pfj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UsvyoolCXPGifPPput5EkvxYqIiH/fv+ohqKnbks3LY=;
 b=oDOJ/GnHCr6v2RHN7CitzpPwAsdyNuQVzl1AmdPweTLbtzJF5YvAtlgHh+rWf1R5Q8
 vU2NdYIlI22hDKgUHAkZ3zMAQ7goFtKHR+4hm5Pz3zCLyWDvYFVxfks3H4PyfkY3Au0y
 1QWF9mC5UIE9s1pg0MSDMKnV2bx9ndgvDMZ/sDfODAossxH63zeiZJvfSLfjdMQtM56E
 L8JW2LKeyODqV/wi7xEKdm8xs4oyp7jMI2p734Gh9DSDjOZ7Nphx35klhJXZjOlp9B7/
 GtHrFcrbxqBPUETOta6ulKS2PS30whxTqqd8e5MoSngklEjQV00awzXHmLwr7YgcHXCv
 L1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UsvyoolCXPGifPPput5EkvxYqIiH/fv+ohqKnbks3LY=;
 b=WkBzOkP1a+L5ooGCnsS64oi5rygfTdpNauFZ9FMIAU513T91ZZVboPFkU/ZXHshqGB
 xVFGiY+N0qWO5L1uqjHiBUiQevu7VWB4GYQMhzsqyVp8MCFhEQMeAS6Kjb07aIE8zzBd
 vkjirn9tTI++d0llNwjRKAmwLBXSjMEi+1+rUpkVAsWd382CiUPrvbHk6N22gCPuutU7
 ktFzmlFdoqj8SuhAgE55i/vMbTbwCYi6PBFTy+9XxqVmaoSBcRK/4SGB3CSPVbnx2ZbU
 E4xu7hS1rog+77foGfda51QmbRR2SnaVPUWG1OoBcGIulxzouv3JTVQip9FeeAQR0IkP
 K17Q==
X-Gm-Message-State: AOAM532lNpYEsSTzSdY9CaUlrf1KM5hp446b1/vmuIsD41DxlY01UIcp
 t9DsfqnDshS7g08XEqs8JBI=
X-Google-Smtp-Source: ABdhPJw7WCTIgQ8Skg+SBGmSpdINI/2sBT2t0utzFWNf3VFe7deMusnEM5z10SkPi1B2LyQcKIsYUA==
X-Received: by 2002:a17:90a:e453:: with SMTP id
 jp19mr11518525pjb.34.1602352096486; 
 Sat, 10 Oct 2020 10:48:16 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id g4sm14652311pgg.75.2020.10.10.10.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 10:48:15 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
 <20201010100346.158cbf62@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <c7a7c934-1971-612e-a783-997a36bb69a3@gmail.com>
Date: Sat, 10 Oct 2020 23:18:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010100346.158cbf62@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: usbnet: update
 __usbnet_{read|write}_cmd() to use new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 10/10/20 10:33 pm, Jakub Kicinski wrote:
> On Sat, 10 Oct 2020 12:26:23 +0530 Anant Thazhemadam wrote:
>> GPF_KERNEL
> You haven't even built this, let alone tested :/

I'm really sorry about this.
Turns out, my .config wasn't set generated by make allyesconfig, and thus
this regression went undetected.

I can submit a v2 that doesn't break the build, and which is build tested
properly.
However, I'm not clear on how else I could locally run unit tests pertaining to this
patch. I understand the critical requirement for testing changes and would really
appreciate it if someone could direct me towards some resource or another that
could help me figure that out too.

Once again, I'm really sorry for this oversight.
Thank you for your time.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
