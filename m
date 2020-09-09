Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1649C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:06:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C2B215A4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWj2iioF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C2B215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B708D87108;
	Wed,  9 Sep 2020 10:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOtV223BMNcw; Wed,  9 Sep 2020 10:06:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E47687111;
	Wed,  9 Sep 2020 10:06:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D537C0859;
	Wed,  9 Sep 2020 10:06:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50D41C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE5F281E21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIc0onXNjppM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68C9787511
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:06:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id i1so2066723edv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rYuQ9FT+4m9DZF/zl6tu1R42tR6bJhq4IHrczHtHxTo=;
 b=GWj2iioFTE0yKF2+rMUo93NPAu9EfreyVb6Xkw1GODQRyL/neHXuuXOYtjxrIRldJZ
 016K09m57fsMl6gEoBUfy2TeDR6WZyxKzKeIQS4F7NQAlEIa2lqrDznlJTQKwlokuLUA
 isI9SfjW7/m9dpJFCaRLVmdkxqzTYWhLcMpiD8eeJZBpd7ysVoiv9qLwNzRh3PlQXRrD
 rrPq6e+1gfSw3XN+JiWfR9O5E1at1VnnnOIyfN3D4ktWRJ/+fkiGZwiNbH4M+PzzELpd
 Ct1OU6BxQhDmJsUyiKDOhBtOpLb1IA8x0bQxUtbelbuP4J8LlHeiZ1HRwojMMmq2kNSF
 7ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rYuQ9FT+4m9DZF/zl6tu1R42tR6bJhq4IHrczHtHxTo=;
 b=iwoxjU3KflfhmTwK7IzfYaRNEm1SRYmfPFwnSuStDzJU9KT6CuqxW4E+WJH7xkVYvB
 rumUf4X3ccoqfPmvDjlBWUqrevHeboL+0bIsNRcFmt+ZYNq6Tdq8Rfq5gMn9TP3vIBWI
 wu0JJcFDSYRh1J734/7NYlnHnnhL20yAuat9+iB13q/n8UrV1vwWA8UmT6vVWwU06ZSy
 86TSHXzONv3QgJUPYyMcOTB7KoIvHEopl4hSJHvKbxK8HAp/7pXDIGJHwBjMKpldpZ9e
 qOZn5fZ6yBUeavHo3IK7s8YpN51X8UwasHLNcHXPMi2PPMLlwlxaODWm8ApdLqbtiWZ7
 ivuw==
X-Gm-Message-State: AOAM531x/WiGPpZj/KZkJPDv/62CLPbtgQDUQDryP1y0RThR0w3WzSSD
 lEFcfLK49R4gpwymAt58TRY=
X-Google-Smtp-Source: ABdhPJwqzsZFPacwfD7vzqPUXRVINBaFATYFLDGAMQz0Vz7Fr8o3Rx1HqXczCJ/z/yfAPVlUlsk2ZA==
X-Received: by 2002:aa7:d558:: with SMTP id u24mr3342099edr.336.1599645967911; 
 Wed, 09 Sep 2020 03:06:07 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id t4sm1593478ejj.6.2020.09.09.03.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 03:06:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 12:06:06 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
Message-ID: <alpine.DEB.2.21.2009091152530.5622@felia>
References: <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
 <20200907151417.44453-1-ayush@disroot.org>
 <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>, apw@canonical.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: GIT_COMMIT_ID:
 handle commit messages with multiple quotes
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



On Tue, 8 Sep 2020, Ayush wrote:

> > I think all your examples are broken.
> > 
> > I think all should start with revert
> > i.e.: Reverts commit <SHA-1> ("description...")
> 
> Actually I am talking about those commits which referenced a revert commit.
> 
> For example:
> 
> If I want to mention a revert commit in my commit message, I will do something like.
> 
> This bug appeared first in commit 1234567890ab ("Revert "abc: foo bar"").
> (Just an example)
> 
> Here, according to syntax, it is right but checkpatch.pl gives an error as multiple
> quotes in commit messages are not handled in checkpatch.pl.
>

As the mentor in the linux kernel community bridge program, I usually 
inform the mentees when the review on the mentee mailing list has 
successfully concluded to a first acceptable state and I think it is well 
advised to reach out to the maintainers for further discussion.

You did not do that, but just send some patch to the maintainers.
That is fully up to you, but I will not support the patch acceptance in 
any way, and it suggests that you do not see the need to be mentored.

If you can land patches without mentoring support successfully, that is 
great, but then you do not need a mentorship.

Now, to the commit:

Ayush, your commit message is largely incomprehensible.

Your follow-up explanation that was needed should have been in the commit 
message in the first place.

Ayush, you did not sign-off with your full legal name.

So, I advice NOT TO TAKE this patch.

I did not even start testing and reviewing the code yet.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
