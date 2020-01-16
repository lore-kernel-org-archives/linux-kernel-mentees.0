Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50411C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:56:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 059FA20730
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYotTzIE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059FA20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE381868A8;
	Thu, 16 Jan 2020 10:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIb7PoQ04LfP; Thu, 16 Jan 2020 10:56:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D68748686D;
	Thu, 16 Jan 2020 10:56:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2723C1D81;
	Thu, 16 Jan 2020 10:56:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 614D8C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 49C0C8686D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwSmS0HDyldb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 24A118686A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:56:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b9so9689555pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 02:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=8o90uJGV9iAKEeOBMqcrdzpZLHVPTg9A7ldI6APNKjU=;
 b=WYotTzIEP7u60UAKHFKKjp3mXgyrxMLJIHpUldRo1LT8FyePG9Lxn9m1ZF8xNz75RM
 odKo/MNkJZr456ko8XqaFuaopIcwoMYjvNV/q735LAsdBw9j4CKbenHPG9qozl+lY7am
 wdHkLkWbaEjyEGLuW5Ky5xLO+0wReLq7RWGdEKKzWdwurMQHQGxRk2i+u/IPryWldG+7
 It8lbqE3VZ9wKhdyGbI9N2TkgEJuOf3FiIayUN3kS1Qz7/qQacrylvxf0cDinILXxoxV
 0VLesv9ExDMgu2NXxmAWLwYfKKTdplSO6lpPQ6O7BZcDnbPAMSaSpvUZSwpHQmRq8C1v
 pCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=8o90uJGV9iAKEeOBMqcrdzpZLHVPTg9A7ldI6APNKjU=;
 b=Dk/muvzqKLViH5DAfe92MZ8FsASh/ZTY/fMbVNNLOjQNJaoh2lYeRlABPRqpvmvgq8
 XA89IOS1wIUgfgzPo9q+fkChBQAkmTeNXRIOlvtb7SvK4baQ20kj4N4FlfGRk1r5fOMR
 2jFkO4XEAb9eJlxoamzF2k4onohBjFaGre8AeF7KSwE544Q7j3ogMfEqUxOfATMwMF2O
 J/QkBgi2ldQpS3iIIgEDdHAuL+LZdj0uDHKBNeLhZcKoh+gR2huyxBQibVv0S7uMrmFe
 f9U7VHM/Dn5ePws43bMEJsK989I8riDEj6RMJcqq/qd4f3CaEfZ0gE/At1g4IRBlQV1o
 kGNA==
X-Gm-Message-State: APjAAAU24YWVddNloeGx5Kdn9L3xAOnH1hXqmaV0Mob6qrZI51B0JyNZ
 MfRuSoZqA8CJACvjXmEjU8YU6Adh
X-Google-Smtp-Source: APXvYqx56DybCF60xW1Q1q1WH3SjBUc3XZdWnPDEILy8oeewxqlrLc261maaNgDg3BiqOpr6P/FoOw==
X-Received: by 2002:a62:f243:: with SMTP id y3mr37330304pfl.146.1579172195697; 
 Thu, 16 Jan 2020 02:56:35 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id n4sm23783737pgg.88.2020.01.16.02.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 02:56:35 -0800 (PST)
Message-ID: <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 16 Jan 2020 16:26:30 +0530
In-Reply-To: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
References: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH] parsing_c: Add space for
	tokens after *
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDExOjQwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IEluIGNlcnRhaW4gY2FzZXMsIHRoZXJlIGlzIG5vIHNwYWNlIGFkZGVkIGFmdGVyIHRoZSBQ
b2ludGVyIHR5cGUuCj4gCj4gV2lsbCBzdWNoIGEgcHJldHR5LXByaW50aW5nIGRldGFpbCBtYXR0
ZXIgYWxzbyBmb3IgdGhlIGNsYXJpZmljYXRpb24KPiBvZgo+IGEgdG9waWMgbGlrZSDigJxNYWtl
IGNoYW5nZSBpbmZsdWVuY2UgY29uZmlndXJhYmxlIGZvciBjb2Rpbmcgc3R5bGUKPiBydWxlc+KA
nT8KPiBodHRwczovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9jb2NjaW5lbGxlL2lzc3Vlcy8zNwo+
IAoKTm90IHN1cmUgd2hhdCB5b3UgbWVhbi4gSWYgeW91IG1lYW4gdG8gc2F5IHRoYXQgdGhlIHJl
c3VsdCBzaG91bGQKY29uZm9ybSB0byB0aGUgTGludXggY29kaW5nIHN0eWxlIChpLmUuIHRoZSBy
ZXN1bHQgc2hvdWxkIGJlICJjb25zdApjaGFyICogY29uc3QgKiB5IiB3aXRoIHNwYWNlcyBldCBh
bCBpbnRhY3QpLCB0aGF0IHNlZW1zIGxpa2Ugc29tZXRoaW5nCmZvciBhIGRpZmZlcmVudCBwYXRj
aCwgcmlnaHQ/IFdoZXRoZXIgeW91IHdhbnQgQ29jY2luZWxsZSB0byBjb25mb3JtIHRvCkxpbnV4
IGNvZGluZyBzdHlsZSBvciBub3QsIHRoZSBzcGFjZSBzaG91bGQgYmUgYWRkZWQgZWl0aGVyIHdh
eS4KCkNoZWVycywKSmFza2FyYW4uCgo+IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
