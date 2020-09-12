Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BE7C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:17:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474ED208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUdZiiWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474ED208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D889787226;
	Sat, 12 Sep 2020 11:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fAGkUA-uLxF; Sat, 12 Sep 2020 11:17:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69867871BD;
	Sat, 12 Sep 2020 11:17:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 566F8C0052;
	Sat, 12 Sep 2020 11:17:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67EB2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5632287616
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wcECie1i0lx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:17:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A4868724B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:17:36 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id ay8so12909507edb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7QhVyLZuLu2vUVXCtGzO3rHuI4nszoqZQ8+Wksgjt28=;
 b=kUdZiiWnogxoTN1MzaozDXwucncSIrx8kAqf8D76tLWbFa+Wi2T5YNLy2nqv7AHWBn
 9xE0T0cHvB9WUH6Ba4y5X4OQeqtAIXhipqFylbAvmF661jSTbaB3xrSDdvaBhQqqXM4x
 qBvDoPiKxlx93bjqaZpwF4G7IirEJ3t+y2r/ftGYxMU38PRi1D8tbD79b5YfeiHmC+gj
 RTfS9bssy8HeamZKLZ3cs+lJWpsNO8bw9qynWEqxgdW8NVk2gkaw7JmxqkhyYgj6XRFK
 KTncEZGSckUKxeWw+ktWY7FnURsBKyxBMC1wa2QyCo2HAza+7Hp3fLQeDaSzg9Tt2gF0
 xPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7QhVyLZuLu2vUVXCtGzO3rHuI4nszoqZQ8+Wksgjt28=;
 b=BMAdtZLP5TQP8S4ozhlWvYxOfzZMkccbpKSgDQV+7ICU6YHJrQ5FMH59GzOSYwGuy3
 wazK7udwZ3ZXkqjagW6zNYgKINUZseASXnmQ23obHfByQmeoQVdkEMb7dRMRpnsDO/YZ
 c5n9nSltazKYXzwYYu5g+Odhj15z5ryT52mpli05fflP0kjPCgFQPPxYxAsoFpwLQ8de
 sBfC24uUT4zfWtKJLRX3X6BHpRGx9URXmzNF704gmmm0R2cSs4OR18/BRS5K/2asnKA5
 h8d0Vg6+9PRYfr670QOHa2eTZDOSvX9aS1M3nu5MeHQ4dZQiBbg2f1u+WTAgf2b31Dy8
 XP5g==
X-Gm-Message-State: AOAM530QshjOMY3Un58W/+esCeSSnW1CYn6MfgMHwvavyBp43Pbu8PGG
 H8l85eAdoXzQbxSZgGSlSnU=
X-Google-Smtp-Source: ABdhPJyy5VpaVtmy1kCgJDbihu2b6Ci28ZSVb6RS4g7fYw1RHzM35K4JNa4RF8ZRunxAqq3emUYj+A==
X-Received: by 2002:a50:d304:: with SMTP id g4mr7669381edh.248.1599909454806; 
 Sat, 12 Sep 2020 04:17:34 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id r15sm4360346edv.94.2020.09.12.04.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:17:34 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 13:17:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <20200912094826.150170-1-ayush@disroot.org>
Message-ID: <alpine.DEB.2.21.2009121312370.13082@felia>
References: <20200912094826.150170-1-ayush@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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



On Sat, 12 Sep 2020, Ayush wrote:

> checkpatch.pl checks for proper references to other commits with
> the intended format, commit <12+ characters of SHA-1 ID> ("<commit
> message") and warns about typical mistakes. Currently, it does
> not handle the case where there is a line break between commit and the
> hash value.
> It falsely warns that the hash is not prefixed by the word commit.
> 
> This adds new conditions to parse and identify such commits and

s/commit/commit references/

> to not report an error in such cases.
>

---
> following type of commit reference is handled:
> 
> - commit
> f4d51dffc6c01 ("Linux 5.9-rc4")
>
---
This part above is superfluous; I do not see the added value here.
 
> This issue was discovered through a thorough analysis of checkpatch.pl
> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and v5.8.
> 
> Before applying this patch, checkpatch.pl reported 342 errors of type
> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
>

Impressive numbers of improvement if that is true and not a bug.

I am currently running my evaluation to see if I see the same numbers; I 
will get back to you.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
