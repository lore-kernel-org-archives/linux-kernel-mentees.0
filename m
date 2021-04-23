Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F2C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0076F61006
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0076F61006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B768E40443;
	Fri, 23 Apr 2021 20:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZNT73TUbpRV; Fri, 23 Apr 2021 20:45:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBCB403C2;
	Fri, 23 Apr 2021 20:45:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 506CEC000E;
	Fri, 23 Apr 2021 20:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34CB9C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B54A83CF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYuLYz90ELlX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:45:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D455E83CEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:45:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 12so79113949lfq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1pKvrLPooCfDxgOHq5YwIMwP0kH7IA1sQ6mtjIIn04=;
 b=U4ngz44ZjspORE5DUzD2u2VTWdvXWeHX6s/cHUQFTSNKiqQQNKW0YxTNGk4Z+V0LTB
 mAAf7tDUx/BVcGk3J29XKx6dhfkFezqFv14PQN1TR8dZpaiO+f1GwfBAWuQjSZ+hF2Fi
 A1VepEkMnPamc+xmm+cPE9mjXOQBJ8Z8SCMPOfADidgjN5/Yigs/VPwGEleaTs6gWCdQ
 P8pZR01xN/RbdU4tebKEDBCFfk8JP0Kx/NRKxPLik7O6CnIc5lw5YMfmVB/NprgU4Qmz
 D1xdVaN9khs2IH18G93z0KYTifmVc02eSYzffCf3NH6O+hqrGHI7L82okNGiOvbYn/p2
 0gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1pKvrLPooCfDxgOHq5YwIMwP0kH7IA1sQ6mtjIIn04=;
 b=ORSl2qtJbpKpUwYd6nXhzbzfWchXH8xfzqSk64JFxOwsPtuLtV1DAWxfntLJ1Fm27t
 rv6QZzUdjlq0i9ACjWrmxRgfmgAN4IrckFX9i3O5ZYfDQOasmsGpw+LWUn+WgPdHC6iJ
 GepQqH63aCUgSEDR2CgbLGVTHGRnOnpBZ245taqewVo23dmgKdaBReGV3P6Rk1MggxHQ
 2koPRwNEye3Tm/KFAcOU7qF08YrXaETVH6UlPtCiLMt0Dgfmlj+rCTlhlYbvf64MfcO9
 KHU5dKHTQIW05iZwqRJ/UgnF9Smr8zkpiLKycwOMM6Oi/wYAkjvmCDIH+UfMVrDYQHAp
 pRgA==
X-Gm-Message-State: AOAM5308t+ik0N0eE5d6Qf/iPRsfq3du+vWMKxxA5x40jA8gH5hARxbb
 OZICmt0hLrrIDlS2Ir35xU0=
X-Google-Smtp-Source: ABdhPJz1up9mi0tlHxEZbkuZ1mgVJljt1EzZeK8mmmxdR5o3Lk1jLRrFQ8QFdsmnmRtSY6VACWdtqg==
X-Received: by 2002:a05:6512:3e27:: with SMTP id
 i39mr4064659lfv.581.1619210700698; 
 Fri, 23 Apr 2021 13:45:00 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
 by smtp.gmail.com with ESMTPSA id k18sm641058lfj.203.2021.04.23.13.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 13:45:00 -0700 (PDT)
Date: Fri, 23 Apr 2021 23:44:58 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
Message-ID: <20210423234458.3f754de2@gmail.com>
In-Reply-To: <36f126fc-6a5e-a078-4cf0-c73d6795a111@linuxfoundation.org>
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
 <20210422215511.01489adb@gmail.com>
 <36f126fc-6a5e-a078-4cf0-c73d6795a111@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Atul Gopinathan <atulgopinathan@gmail.com>, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
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

Hi!

On Fri, 23 Apr 2021 14:19:15 -0600
Shuah Khan <skhan@linuxfoundation.org> wrote:
> On 4/22/21 12:55 PM, Pavel Skripkin wrote:
> > Hi!
> > 
> > On Thu, 22 Apr 2021 21:37:42 +0530
> > Atul Gopinathan <atulgopinathan@gmail.com> wrote:
> >> During probing phase of a gspca driver in "gspca_dev_probe2()", the
> >> stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
> >> hdcs_1020 and pb_0100) that allocate memory for their respective
> >> sensor which is passed to the "sd->sensor_priv" field. During the
> >> same probe routine, after "sensor_priv" allocation, there are
> >> chances of later functions invoked to fail which result in the
> >> probing routine to end immediately via "goto out" path. While
> >> doing so, the memory allocated earlier for the sensor isn't taken
> >> care of resulting in memory leak.
> >>
> >> Fix this by adding operations to the gspca, stv06xx and down to the
> >> sensor levels to free this allocated memory during gspca probe
> >> failure.
> >>
> >> -
> >> The current level of hierarchy looks something like this:
> >>
> >> 	gspca (main driver) represented by struct gspca_dev
> >> 	   |
> >> ___________|_____________________________________
> >> |	|	|	|	|		| (subdrivers)
> >> 			|			  represented
> >>   			stv06xx			  by
> >> "struct sd" |
> >>   	 _______________|_______________
> >>   	 |	|	|	|	|  (sensors)
> >> 	 	|			|
> >>   		hdcs_1x00/1020		pb01000
> >> 			|_________________|
> >> 				|
> >> 			These three sensor variants
> >> 			allocate memory for
> >> 			"sd->sensor_priv" field.
> >>
> >> Here, "struct gspca_dev" is the representation used in the top
> >> level. In the sub-driver levels, "gspca_dev" pointer is cast to
> >> "struct sd*", something like this:
> >>
> >> 	struct sd *sd = (struct sd *)gspca_dev;
> >>
> >> This is possible because the first field of "struct sd" is
> >> "gspca_dev":
> >>
> >> 	struct sd {
> >> 		struct gspca_dev;
> >> 		.
> >> 		.
> >> 	}
> >>
> >> Therefore, to deallocate the "sd->sensor_priv" fields from
> >> "gspca_dev_probe2()" which is at the top level, the patch creates
> >> operations for the subdrivers and sensors to be invoked from the
> >> gspca driver levels. These operations essentially free the
> >> "sd->sensor_priv" which were allocated by the "config" and
> >> "init_controls" operations in the case of stv06xx sub-drivers and
> >> the sensor levels.
> >>
> >> This patch doesn't affect other sub-drivers or even sensors who
> >> never allocate memory to "sensor_priv". It has also been tested by
> >> syzbot and it returned an "OK" result.
> >>
> >> https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
> >> -
> >>
> >> Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
> >> subdriver.") Cc: stable@vger.kernel.org
> >> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> >> Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> >> Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> >> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
> > 
> > AFAIK, something similar is already applied to linux-media tree
> > https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25
> > 
> 
> Pavel,
> 
> Does the above handle the other drivers hdcs_1x00/1020 and pb01000?
> 
> Atul's patch handles those cases. If thoese code paths need to be
> fixes, Atul could do a patch on top of yours perhaps?
> 
> thanks,
> -- Shuah
> 
> 

It's not my patch. I've sent a patch sometime ago, but it was reject
by Mauro (we had a small discussion on linux-media mailing-list), then
Hans wrote the patch based on my leak discoverage.

I added Hans to CC, maybe, he will help :)


With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
