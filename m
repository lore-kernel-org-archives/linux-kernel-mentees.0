Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54AFC2D0E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 20:00:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD8920658
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 20:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ufHX6lNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD8920658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 384C12041E;
	Wed, 25 Mar 2020 20:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5d8VArgO82YI; Wed, 25 Mar 2020 20:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E4B202012D;
	Wed, 25 Mar 2020 20:00:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDD79C1D7C;
	Wed, 25 Mar 2020 20:00:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B536DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9FDFC878E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxjYpS2RVXIu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF1B0878BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 20:00:37 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id v38so1762002qvf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=CNLSBHbgQgkrb9hk4E4BnfHfyrwW8sJKENApvLoWymI=;
 b=ufHX6lNvCBlGqqQ3BZ+UC21OXlDmGTXQOq7Qfc8g6BhJA8fshB+BTf400/S+bc9xAw
 l16UJCr0NAPG8r+p0Zzvj/+zLKCs04DuaReV4ByPX8k/k5DHbDi2m1lQ9WgcVO/6K99M
 70Vg/bFa5TGVaeWY2P2wJ81drl/XmE6JG59CP0dhB/ErThTb1Fu0JVWmNif5Z/5H8r3t
 nCgkTUC9f+AIFH1jg6p4f3WeUZ2XaIhN6qL9442EdA9k5Kd8619gwWyNxRI9mNIUVJpm
 VTGXy5FHZO+OFQczp8QLE4W1FnZJzUIj2mNgt4wSjVKbt+OhpyaG0Ee0ijeKpqnYiN9X
 dQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=CNLSBHbgQgkrb9hk4E4BnfHfyrwW8sJKENApvLoWymI=;
 b=te4fnHe76W1m4MAJwJkpauSEvfB3CleoHDrPDsHFa+Zxj1OwPBCln6U0BJQfVpTkOt
 CvXXZuiqhKtI07HhOPzIS+VwG6ObryNF7LQxH9YOBpOpDijk92RjXlxgprdfamBVxpdq
 Ea+dflIoZJV/P/saEggi6+2aa/jh3uRO6tZiBdD4DcUZrDMw4ZM9Tzb8U/zP3KOXz6sz
 G3PH4oQgao86j7wdePb0/yqXkn0j4EOCfEU2yVbjgIuojFaPtiqW2LzD1wQnbCTLQAiQ
 z+B2A60IuRtV6ESjNJK/9nk16SPtoxQBZSmPqoxNHV/UFmz5HJmM2qH4IxulIrMRngzG
 OGrQ==
X-Gm-Message-State: ANhLgQ0lIknliaL1Vg8I+bniqRHuV0pKUm1/ChAO/XtM7h53OxcqtoyP
 cMGfOkZxiZFlEf2/iBormCuM4UGt
X-Google-Smtp-Source: ADFU+vtiotvr4uR9furdT6FgbbFnZ9bw/pvzatAyG3qS8UmThi70bCU2+Z5T7OBvDWAD/uUFBW+0Dg==
X-Received: by 2002:a0c:b257:: with SMTP id k23mr4772809qve.167.1585166435816; 
 Wed, 25 Mar 2020 13:00:35 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 5sm7618083qka.16.2020.03.25.13.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 13:00:35 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
Date: Wed, 25 Mar 2020 17:00:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 sean@mess.org
Subject: [Linux-kernel-mentees] We should settle on a name for the new DVB
	virtual driver.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

SXQgaGFzIGNvbWUgdG8gbXkgYXR0ZW50aW9uIHRoYXQgdGhpcyBwYXRjaMKgIC0gCmh0dHBzOi8v
cGF0Y2h3b3JrLmxpbnV4dHYub3JnL3BhdGNoLzYyNDk0L8KgIC0gaGFzIHJlb3JnYW5pemVkIGEg
ZmV3IApkaXJlY3RvcmllcyBpbiB0aGUgbWVkaWEgdHJlZSwgcHVzaGluZyB0ZXN0IGRyaXZlcnMg
aW50byB0aGVpciBvd24gCmRpcmVjdG9yeS4KCgpJbiBhbiBlZmZvcnQgdG8gcmVkdWNlIHRoZSBh
bW91bnQgb2YgcmVuYW1pbmcgZG93biB0aGUgbGluZSwgYW5kIGFsc28gdG8gCmFkYXB0IHRvIHRo
ZSBuZXcgc3RydWN0dXJlIHByZXNlbnRlZCBhYm92ZSBJIHRoaW5rIGl0IGlzIGEgZ29vZCB0aW1l
IHRvIApjb21lIHVwIHdpdGggYSBuYW1lIGZvciB0aGUgRFZCIHZpcnR1YWwgZHJpdmVyLiBJdCBt
aWdodCBhbHNvIGJlIGEgZ29vZCAKaWRlYSB0byBtb3ZlIGl0IHRvIGl0cyBvd24gZGlyZWN0b3J5
IGFzIHdlbGwgd2hpbGUgd2UncmUgYXQgaXQuCgpNeSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHZp
ZHZiLCB3aGljaCBpcyBzb21ld2hhdCBpbiBsaW5lIHdpdGggdGhlIApuYW1pbmcgc2NoZW1lIHVz
ZWQgYnkgb3RoZXIgdmlydHVhbCBkcml2ZXJzIGZvciB0aGUgbWVkaWEgc3Vic3lzdGVtLgoKUGxl
YXNlIGNoaW1lIGluLgoKVGhhbmtzLgoKLSBEYW5pZWwuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
