Return-Path: <SRS0=Zzie=JT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A15C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 18:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C0A61405
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 18:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C0A61405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B45C403D9;
	Thu, 22 Apr 2021 18:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQubN78mKWbp; Thu, 22 Apr 2021 18:55:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC74240210;
	Thu, 22 Apr 2021 18:55:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F851C000F;
	Thu, 22 Apr 2021 18:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 732A6C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6719840621
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yU7JwzgSbvft
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7933405C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:55:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a1so53075059ljp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I43MDT/4gAbtWwlihJ3mHIvjj3Y/M26LvMzUi1efgUY=;
 b=vdI4R2FP7yHLFU9m2C01Ek5+PqDZvLCFFV8gsOCoi+N4Hr3/lVqIGjXBXZrzgKiIsP
 T8l8TzMZipVEmkX43o16utrBo355zl3cGFwXK8KH1NFXDgwhHR6aL1k+61cvhr2o2Ej7
 +mVz4iG3nkBJAqW0mtMkOAEBRPgu5+pb7HGCelq7eLQtdqHrB5XsUxWHnLaeB5YAYDJQ
 mYGHZr8quQuPjWDBLAcw4wBOk3nIDreGonIsoDwBden65sv7oYK4mmymvL8YYL2RelWw
 hzRzrJIDaPdzX1Ps9D350oH2xxu6LBmY1QZsDGsiT2hcoD8MckrI7hnr+BLKv6J9LAyP
 slQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I43MDT/4gAbtWwlihJ3mHIvjj3Y/M26LvMzUi1efgUY=;
 b=VEl0U6iJG+ObdImJOQRPNZM624Yfni46teSKg1uKeh8JW+e38n6j8EVpqoxHG39MH0
 luSIYOQPflp/ti7zTqYFXyFvODg/78eBHe3C1072/2vcifs3Ub89L0zs3s6KIDP0x1lB
 qEg0f36pHIgHNgcbtkzEqgkJk05QzsPDRIyy9PfLWCBNoq0gKR0MOjyYMsVeNSboT3GQ
 foHGi4w3eA4eE2HqKpGw9iQV12JARXMSNv5o580YB+iuQTszaO35ANYcVD3Y6wU4fGnW
 lKgc0f4wX4KnUmZpe81cJq0pZB+rnLK1la4A7d9KQQGpNNSIpt+6uV0QlyQW0BO6LL6L
 xeTg==
X-Gm-Message-State: AOAM533x8vWK2xK2ObiNQzgkkKbceX0Uo2tCD2ymS96MbZwLK0VZjnRD
 mgBsbHu+DD6/DuJ8Xw+U3IA=
X-Google-Smtp-Source: ABdhPJyMQuqDEQ+rl5JGM/TJjvEw0vHbxW8I+fWGTaD4kxtT+pL7kixLKZZM2c8A2IWRLGG0qVKAxA==
X-Received: by 2002:a2e:90d2:: with SMTP id o18mr179885ljg.288.1619117714738; 
 Thu, 22 Apr 2021 11:55:14 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
 by smtp.gmail.com with ESMTPSA id u8sm332634lfm.133.2021.04.22.11.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:55:14 -0700 (PDT)
Date: Thu, 22 Apr 2021 21:55:11 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Atul Gopinathan <atulgopinathan@gmail.com>
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
Message-ID: <20210422215511.01489adb@gmail.com>
In-Reply-To: <20210422160742.7166-1-atulgopinathan@gmail.com>
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On Thu, 22 Apr 2021 21:37:42 +0530
Atul Gopinathan <atulgopinathan@gmail.com> wrote:
> During probing phase of a gspca driver in "gspca_dev_probe2()", the
> stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
> hdcs_1020 and pb_0100) that allocate memory for their respective
> sensor which is passed to the "sd->sensor_priv" field. During the
> same probe routine, after "sensor_priv" allocation, there are chances
> of later functions invoked to fail which result in the probing
> routine to end immediately via "goto out" path. While doing so, the
> memory allocated earlier for the sensor isn't taken care of resulting
> in memory leak.
> 
> Fix this by adding operations to the gspca, stv06xx and down to the
> sensor levels to free this allocated memory during gspca probe
> failure.
> 
> -
> The current level of hierarchy looks something like this:
> 
> 	gspca (main driver) represented by struct gspca_dev
> 	   |
> ___________|_____________________________________
> |	|	|	|	|		| (subdrivers)
> 			|			  represented
>  			stv06xx			  by "struct
> sd" |
>  	 _______________|_______________
>  	 |	|	|	|	|  (sensors)
> 	 	|			|
>  		hdcs_1x00/1020		pb01000
> 			|_________________|
> 				|
> 			These three sensor variants
> 			allocate memory for
> 			"sd->sensor_priv" field.
> 
> Here, "struct gspca_dev" is the representation used in the top level.
> In the sub-driver levels, "gspca_dev" pointer is cast to "struct sd*",
> something like this:
> 
> 	struct sd *sd = (struct sd *)gspca_dev;
> 
> This is possible because the first field of "struct sd" is
> "gspca_dev":
> 
> 	struct sd {
> 		struct gspca_dev;
> 		.
> 		.
> 	}
> 
> Therefore, to deallocate the "sd->sensor_priv" fields from
> "gspca_dev_probe2()" which is at the top level, the patch creates
> operations for the subdrivers and sensors to be invoked from the gspca
> driver levels. These operations essentially free the "sd->sensor_priv"
> which were allocated by the "config" and "init_controls" operations in
> the case of stv06xx sub-drivers and the sensor levels.
> 
> This patch doesn't affect other sub-drivers or even sensors who never
> allocate memory to "sensor_priv". It has also been tested by syzbot
> and it returned an "OK" result.
> 
> https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
> -
> 
> Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
> subdriver.") Cc: stable@vger.kernel.org
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>

AFAIK, something similar is already applied to linux-media tree
https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25

-- 
With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
