Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395A2C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:44:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A445721548
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0VuAUXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A445721548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4EF1E2041D;
	Sat, 12 Sep 2020 11:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZGBrmCXIH1a; Sat, 12 Sep 2020 11:44:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9F7EF20402;
	Sat, 12 Sep 2020 11:44:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F80C0052;
	Sat, 12 Sep 2020 11:44:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 945B6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C9B885D56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttEAFeDW-SVZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:44:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ACABE85A7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:44:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id z22so16884112ejl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NgoDHV0W5LPOi3z8eUWVWyA/nvp4+E29SdpzEwS4TrQ=;
 b=k0VuAUXBCLNH7y9U0mGwO0F3uiHhxWObB0RaAks8MM7yHH5fDyUAde6dhWRIgVKrxI
 B12qdAHpugbxmimCCr+fEVqxQm+GdJwTalYMbagyQiDpLF6viCYT9QLGS4pVhv2f+mwi
 Ui4IbkDj8cxOFImr0xX8ZVBKAd0xuI0BIBX0QY4E29sSAZMax/DcssmJZGGU4R1R4/2Y
 KPNB60xxbHTllRq7gjDqvuKnmCZDsDbaG68/Irtt63wOE/Yn0UWT1a5dyPVMeoncapmv
 z+e/EwzXPD293kwFDNAO5rZLdNlUM88Q6skmFUirvF07J9tyuNJTRCPXMDDOS9806YYq
 0XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NgoDHV0W5LPOi3z8eUWVWyA/nvp4+E29SdpzEwS4TrQ=;
 b=flMx0WvADcDLHVAPuQeNiRbYoos2sMYg73WM/s7O0mWWBmWMtTY7L4o93YjY1Gpjav
 DvS0Y+pVALSZ5ptq9Bm4rI8iCvYWcBfNudWsZORYDDZRMsxd0x/Y7SiO/m6hph0qZEEv
 fkycCbEsv4+r1h/O+Dz68HwT9rFxlvDTcJK1EuEwu7dFZEAGpZrG12Mz3Iduyb0cWq1N
 MGZHt/oExbDdhsm2zbR2zW3gSyP++O1pfpkduo2945UhBSunoEtk0oFw4DZ5GB3/i2jv
 ClBaAM41Vvmsta/zegpj/4PN9BHcshSTeJBo4lJQEuXA50PC9cO72/l1n6AFo9MZEXhK
 SdcA==
X-Gm-Message-State: AOAM530pyS6ChJpoiITGMqRTv9tqAtBnpwWZKNTVaqopF9/EV5Y8lmxc
 4VwPCyMwV4RbP4Gm1EzKdiE=
X-Google-Smtp-Source: ABdhPJw6mQ44kHXcnh3IJnku3Kx0bmFpKBuFzeBgVcIikmRiyJ+NA8UhbyIWH7j+B7j2fSU6CmSmFw==
X-Received: by 2002:a17:906:71cc:: with SMTP id
 i12mr5674447ejk.507.1599911052955; 
 Sat, 12 Sep 2020 04:44:12 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id ly16sm3122439ejb.58.2020.09.12.04.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:44:12 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 13:44:11 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
Message-ID: <alpine.DEB.2.21.2009121343290.13082@felia>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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



On Sat, 12 Sep 2020, Ujjwal Kumar wrote:

> Hello Lukas,
> 
> I attempted the tasks.
> 
> Below is the link of GitHub repository containing my write-up and findings.
> https://github.com/Ujjwal0501/lkmp-checkpatch
>

Thanks, it shows 404. Good luck next time.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
