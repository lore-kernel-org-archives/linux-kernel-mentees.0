Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CEAC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A65721D24
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVYuPil2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A65721D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E6BE8726D;
	Tue, 27 Oct 2020 10:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzuQhzn05iaT; Tue, 27 Oct 2020 10:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 099088724D;
	Tue, 27 Oct 2020 10:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5F36C1AD5;
	Tue, 27 Oct 2020 10:04:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76E4AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6616F843EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqF-ModP4LAh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E702284693
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:04:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id bc23so793023edb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8pTHQKR+vcS+hwLl92NUAFl9Lf9iYDupp1UFEMFqwoo=;
 b=jVYuPil2SST9HRcmViUDFdXkOjS5NPHaDntnbgIuk2wQlAjfm0ippuBKOBjAtCzEW7
 bxjfDvsb6v9MSwaUEKyVF/mXxyoLq8h0P0NlP45pxudvVPnT4rjX75LMhE/biSmVnR2G
 bPx4uNTr6qBFrrqn/W6gVhXssmBBj0iF1DAGMQy2GcHqH8WY8/We/QZK5NEwvDCNSrQh
 vP4vZvb5EeSt2oQCtiTwxFf17wf1xvo87ROWbaW3Ug3K/cDP2SLM/I8PPcPv1eJnx4xK
 ehUmqJrGP4PTldfB9x8metOYEKq/bxEvLOui/kZJhumhrcCzIDabPdmz7inRQs7FgI8p
 4JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8pTHQKR+vcS+hwLl92NUAFl9Lf9iYDupp1UFEMFqwoo=;
 b=WK67fHIfGDXL7EgJtAsKhv90LZAcGp5WpyNX/JwFcYbIaQXJnlzN3Mv3c7VxYqkNKg
 9oTNNYsyBs3XJFW0KYO8pm/VPBinTMNXcEhJyBPTe4cyvmpgH6KxrQrcw0rUQoSO+ZvK
 lbO+tUxe9BQLXC+YYkl3Ywnqmo4qAPo88qGkccKsPorDDQArmR+if5+Y9YBLroTBSJsJ
 2xyWR/giG2qNn/rmNcl+239xiQ642CS6L6JsqZ79DFO3ym+1aMkyZ51E3fbEksl+g57l
 QJC7BFLUDjqTgRJ2T/3u3YzNJc0/MV/71U+FoBS+cVXVsjGeCzzHFQdYtjAeudLnhQ+w
 gf8A==
X-Gm-Message-State: AOAM530Q+C3S058eArufktNJELGTT7UWjfPAqblvrEygI0QCI53gp+tj
 j+KEezu5habYPrXrLx2/fAE=
X-Google-Smtp-Source: ABdhPJz7ZK19xBO1J01VPLa7sY75HpzJA1bLI79e4Q4R6ARP69i9h9QO9FqOXB3KWB0iTkKnwuKYzQ==
X-Received: by 2002:a50:cf45:: with SMTP id d5mr1315465edk.225.1603793067279; 
 Tue, 27 Oct 2020 03:04:27 -0700 (PDT)
Received: from felia ([2001:16b8:2de9:3700:3160:107b:5425:634f])
 by smtp.gmail.com with ESMTPSA id m11sm638880edv.14.2020.10.27.03.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:04:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 27 Oct 2020 11:04:25 +0100 (CET)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5DfCpCA3eD48WPU0H11gRTEN6eZzJvk7LEPVnPUj0M=Lg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010271053560.7937@felia>
References: <alpine.DEB.2.21.2010270918030.7937@felia>
 <CABJPP5DfCpCA3eD48WPU0H11gRTEN6eZzJvk7LEPVnPUj0M=Lg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Current state of your checkpatch.pl work
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

On Tue, 27 Oct 2020, Dwaipayan Ray wrote:

> On Tue, Oct 27, 2020 at 1:58 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Hi Dwaipayan,
> >
> > can you quickly update your Google Doc with the current state of
> > patches/features that you are currently working on, that are done, and
> > that we decided not to work on?
> >
> > Just to make sure that in case Aditya wants to start working on something,
> > we do not coincidently work there on the same and duplicate the efforts.
> >
> >
> > Thanks,
> >
> > Lukas
> 
> Hi,
> I have updated the docs with the data - current status, solved ones and
> things which need to be done and things which should not be done.
> 
> The link is:
> https://docs.google.com/document/d/1kO6Bq27OFHgQaQYKIfSLh-0tfO_7gQIe6CdrVxY6AMQ/edit?usp=sharing
> 
> Please let me know if you can access it and if I should add anything
> more to it for clarity.
>

Looks good to me. I think you are on a good path considering the issues 
you are looking at and the patches you are preparing.

No need for more details... just keep working on the patches. So far, Joe 
Perches has accepted them all after a few code reviews.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
