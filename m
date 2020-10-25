Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CA8C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 06:11:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A531208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 06:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl4tK/aD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A531208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 238DF874E8;
	Sun, 25 Oct 2020 06:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBrlzfnjOruv; Sun, 25 Oct 2020 06:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B04D8871A1;
	Sun, 25 Oct 2020 06:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F04FC088B;
	Sun, 25 Oct 2020 06:11:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D699C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8019186A81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKuQfjtXgh6K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:11:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F7E584EE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:11:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l15so8820876wmi.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iQdJQCMJn7+Ib4L7UUsX62v/7dWGCsK4jU3a8CuDpUc=;
 b=Gl4tK/aD13wQK8gnRuTkf8SLuCqmqCR7cICqZcp//0ffhzvLP4RlByMJFEjg0DlEZz
 N3iV7Xb3kyn+zj0cfAtD21QsRXeHDcawPUpTw2xMonr+bTxc7j4jDoPhu+UOFV74/79k
 ME3G4mZcYV4KO4hdK8dWZ1DuZAkzzKGMIfMk2V2HgtGBZy9V/dFrG546C5Vj2sCEM645
 /3ATUch+APiM1UdL4IxZn8w3OOBRfEkF/88EWeN9raNlvYIMJMEB1WtAlsdb/6UnCTS4
 fYs3x6Uoj9N3IrXCoBEmbtAQLDLbWvue99KuDNe18x72ANl6AiNJUQEaT6NyYkT9Tkb6
 rhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iQdJQCMJn7+Ib4L7UUsX62v/7dWGCsK4jU3a8CuDpUc=;
 b=HWbCwUuWHl7uAaIN6Sa8ibnSK+QSyzzpd+TKfgyRGz+neA+u1xvkB9yP0W7ndQcnOl
 wRXMTFsLE1xDX+J4071u78nH3IHgSgTYCauvCLLaQECe3pDdeIGJ27UxPckYQjwSMGla
 e/JmvhC9Y/PC+9Edn8EqERjDPj9DAVs+2+02sZxNcLL8FK9GSh5M4dgHkSKUCjeM4cwc
 MHatGLaEt0+ndMKZ16ivgSPxmgRcsVt43R9oTkkdHJHj2xaC5WKQpCZDyipDzmB4bIYe
 fP6ppzf/SczCipULn+et7MLEuuAfg6yXwPnyUOS8l1VTwuHYC1sXx1sCkFdhKIbXmQVc
 Hg4A==
X-Gm-Message-State: AOAM530AeWqaL/syP7+JFxvnphFLIQbVG02r6jODf8DsYrJRtAMtq1nq
 G3bINONM4gMpHSo5TgLWEcc=
X-Google-Smtp-Source: ABdhPJzZQxw0X0Au43l+lLZhSs2wD1x0gNw4CH23E/KcU8yFrepQnIAKfOmFsIKiBs7B2utbiYt3vQ==
X-Received: by 2002:a7b:c401:: with SMTP id k1mr9903406wmi.120.1603606302494; 
 Sat, 24 Oct 2020 23:11:42 -0700 (PDT)
Received: from felia ([2001:16b8:2d75:ef00:cd2e:52e:ef1c:926])
 by smtp.gmail.com with ESMTPSA id w6sm8744478wmb.28.2020.10.24.23.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 23:11:41 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 25 Oct 2020 07:11:40 +0100 (CET)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <252e2adc7ae9e2886171189f1421e2fe3c33629a.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010250708050.6697@felia>
References: <20201023133828.19609-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2010232104150.11676@felia>
 <c9512657-d7d0-bf04-0e40-b3463c9f5e1b@gmail.com>
 <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
 <alpine.DEB.2.21.2010250627370.6697@felia>
 <252e2adc7ae9e2886171189f1421e2fe3c33629a.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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



On Sat, 24 Oct 2020, Joe Perches wrote:

> On Sun, 2020-10-25 at 06:51 +0100, Lukas Bulwahn wrote:
> > We can identify a set of rules and clear automatic fixes that
> > maintainers can simply run this script over the patches they pick
> > up when they pick them up.
> 
> checkpatch --fix-inplace does that now.
> 
> But realistically, this is more an interactive bit that IMO
> should be a separate script on top of checkpatch.
>

Agree, and of course, we can work with some maintainers to find the best 
way to combine that into their 'pick up and apply patches' scripts?

E.g., some might be using b4 and we simply hook into that in a friendly 
way.

Further just documenting the potential options for maintainer in the 
maintainers handbook might also increase adoption.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
