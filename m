Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4873AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 11:32:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CF620897
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 11:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sebRAI5g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CF620897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E279875F3;
	Wed,  9 Sep 2020 11:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6-IvDc-H-Tb; Wed,  9 Sep 2020 11:32:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08A6087582;
	Wed,  9 Sep 2020 11:32:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9407C0859;
	Wed,  9 Sep 2020 11:32:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A36C3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 11:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9261B871BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 11:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfBkh+20XB-v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 11:32:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7A65987144
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 11:32:33 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id z23so2968640ejr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NECuaxSEf168q0jIzBN26ROkTAWTuBbGDh4gcowtLHY=;
 b=sebRAI5gWmXieZeflql4Wxd8595EtHbk0ITVkD25tgYixk+cPBfo3Su3vwzJHK/mTk
 9qrr5R/TWXNlRxuWLRD7z/GKlNT55VGCS5saQXkDXwTkACQPwsOK3o0W+7K7GeUrhEK8
 4HOUdBYj70etXzOmEFf/PMwYKT8fDbIbAtCx7isevFegXL9L3ru5eOlZH9Q8ExOUICNc
 qo5+sTCTb22zRWRvyphPpSIZ3+TEgFZX7N5oeeQLp+DTdYFUrpDGFAUUbBYnawhbQa+V
 DA6sltri04+VsCqe5jrl9nlarG7hWofBmEz6hX/UbkVIfxBCvAiqpeAQ9r45pe2DFc/a
 xGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NECuaxSEf168q0jIzBN26ROkTAWTuBbGDh4gcowtLHY=;
 b=J7xZkL4CxU9r0H4muDJS2LtovuUC0uzGoHTd1TDubahhCapQDKy5JULJEu8LDhHF72
 1dguyh7QjF2BlEXG/LhX0jtjkQsTJwpcw2baP0ZCaxxyBFRaIp57c2zzS6EiBdlCWG9c
 j8pTAMDZJqo3xOlIi5Bcgb590Df12azMlel+iNGvZJSPw4N6Gx0SJETU/uwM2/mMOxbz
 Yj4ipziFIA6M3RQDwySHokDot/it0LQNd4ybUMgpkIYoCkPpfIatMWPWp1tcAkX9dLv7
 81AavA2HOoTFo0QoM1DLzZL+hD6LZUijCbjwHmS/eHVl8mxOavrGgN8R8qAYJC8nejtG
 ghXw==
X-Gm-Message-State: AOAM530DlsgxECPfQo0RsVyjnr03Um+RvWEv6UlvgfrjN65JE4K9NNXR
 l0U70jYxNGATGsaNtlKehks=
X-Google-Smtp-Source: ABdhPJxfCwCX4J4uyUUx1XwPnddonxEE3wTCxfUo+gVe7Db2JuNDUW80pab7rfxeHNSUPlqdUHvdFw==
X-Received: by 2002:a17:906:556:: with SMTP id
 k22mr3056519eja.369.1599651151882; 
 Wed, 09 Sep 2020 04:32:31 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id bx24sm1872742ejb.51.2020.09.09.04.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 04:32:31 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 13:32:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <3dea1eefdbbf97791bed3f838d4f06a7@disroot.org>
Message-ID: <alpine.DEB.2.21.2009091324590.5622@felia>
References: <alpine.DEB.2.21.2009091152530.5622@felia>
 <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
 <20200907151417.44453-1-ayush@disroot.org>
 <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
 <3dea1eefdbbf97791bed3f838d4f06a7@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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


dropped the maintainers.

On Wed, 9 Sep 2020, Ayush wrote:

> Sir,
> 
> > As the mentor in the linux kernel community bridge program, I usually
> > inform the mentees when the review on the mentee mailing list has
> > successfully concluded to a first acceptable state and I think it is well
> > advised to reach out to the maintainers for further discussion.
> > 
> > You did not do that, but just send some patch to the maintainers.
> > That is fully up to you, but I will not support the patch acceptance in
> > any way, and it suggests that you do not see the need to be mentored.
> > 
> > If you can land patches without mentoring support successfully, that is
> > great, but then you do not need a mentorship.
> 
> I am extremely sorry for my mistakes. It won't happen again.
>  
> > Now, to the commit:
> > 
> > Ayush, your commit message is largely incomprehensible.
> > 
> > Your follow-up explanation that was needed should have been in the commit
> > message in the first place.
> 
> It was my first patch, so I had very little idea of forming commit messages. 
> I will discuss it with mentors next time before sending the patch next time.
>

Let us start with the simpler patch and then see if you can write a commit 
message that convinces Joe to ack your patch.
 
> > Ayush, you did not sign-off with your full legal name.
> 
> My legal name according to all official identification documents of India is Ayush. 
> I have no surname registered legally.
> So should I include "Ayush <ayush@disroot.org>"  or do I need to include my last name too (Which is Ayush only)?
>

Okay. If you say so, I cannot judge but you should try to use a name that 
others can with a fair chance uniquely identify that is you.

The name is used in git log summaries, pull requests, etc.; so, it should 
be a name that with high chance to refer to one person.

Maybe you find a good way that works as suitable name for 
unique identification?


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
