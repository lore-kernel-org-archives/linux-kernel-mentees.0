Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED5FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 12:20:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F19D20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 12:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="OLNZ2C+h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F19D20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C47E720479;
	Fri, 21 Aug 2020 12:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sh3EdgtcC9AK; Fri, 21 Aug 2020 12:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5137E203FA;
	Fri, 21 Aug 2020 12:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 236AAC07FF;
	Fri, 21 Aug 2020 12:19:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34DC0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 232008809D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DK1-v2I9WN4p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:19:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 928BF87C5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:19:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t6so1596485ljk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7lm7viw2YMUXjgsgP6el/CrtyEJ66fPWspB4g27Z+UE=;
 b=OLNZ2C+hzQWkN05HvaTkNkBWtQBcEfyJDGRYk69lhSrQ0LO5xRhea1eMU+uFFFGfCo
 QwFok4KZiwuilU/CnFNIz2ZeriSLhDMvF2SR9EjMqSuBx1OFNEAQ7CeaUbOauKutxSTI
 R1t8RXyh02wQBHbCUM3GatxV04t6/RhjNXuIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lm7viw2YMUXjgsgP6el/CrtyEJ66fPWspB4g27Z+UE=;
 b=pLoBeUezxz1KM4PpCkzLR4uQvA9ha4Q8Gz6Mes8iHIYk+E23FJ0CuWNz7b1UbHVsM4
 YyATF6vq9YWaIUPwF3wxrq5/TIQ4oraCMUTWEv+qcxZaDFRedvn74iFtCz83BXsuQiAG
 iLnTZ1Qq5ohP6shQY+9m2MRFVTMprMmdELefvWzTpTKLNub5BLHqDz58a83TIc9vWJAj
 WgAXDe6g/guDthZ2zSRJ5sxydPld/wuALSxpbDyDgPtEIKSW983YvpNTjd47N2v3UzHE
 WyfRfc8HIsKrL4CidsOmc6VzOzilz817lQztkrRZJEJBHwVLhSlaGr4ocuHK9kq/kMuf
 3+aQ==
X-Gm-Message-State: AOAM533yADfBtFqui9OZDsQtcVagZZWlaCv0stihPx9t9uHcrBYyFKpM
 5wBiRouTR8EGtBm34XhJ72zlDsZkP4YN2HCAi54=
X-Google-Smtp-Source: ABdhPJzRsKTLZwqYP+o27aYkSZiasOfSDYCiGBa3/ktDCA08ZIn/QZNgZm7fZnvFWrNFXtcbYmVu1g==
X-Received: by 2002:a2e:9b4a:: with SMTP id o10mr1458304ljj.199.1598012393003; 
 Fri, 21 Aug 2020 05:19:53 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id s127sm350943lja.119.2020.08.21.05.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 05:19:52 -0700 (PDT)
To: Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20200817043028.76502-1-98.arpi@gmail.com>
 <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
 <20200821113710.GA26290@alley>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4e26f696-3b50-d781-00fd-7fc6fdc2c3eb@rasmusvillemoes.dk>
Date: Fri, 21 Aug 2020 14:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821113710.GA26290@alley>
Content-Language: en-US
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 andriy.shevchenko@linux.intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
	KUnit
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

T24gMjEvMDgvMjAyMCAxMy4zNywgUGV0ciBNbGFkZWsgd3JvdGU6Cj4gT24gTW9uIDIwMjAtMDgt
MTcgMDk6MDY6MzIsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6Cj4+IE9uIDE3LzA4LzIwMjAgMDYu
MzAsIEFycGl0aGEgUmFnaHVuYW5kYW4gd3JvdGU6Cj4+PiBDb252ZXJ0cyB0ZXN0IGxpYi90ZXN0
X3ByaW50Zi5jIHRvIEtVbml0Lgo+Pj4gTW9yZSBpbmZvcm1hdGlvbiBhYm91dCBLVW5pdCBjYW4g
YmUgZm91bmQgYXQKPj4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2Rl
di10b29scy9rdW5pdC9pbmRleC5odG1sLgo+Pj4gS1VuaXQgcHJvdmlkZXMgYSBjb21tb24gZnJh
bWV3b3JrIGZvciB1bml0IHRlc3RzIGluIHRoZSBrZXJuZWwuCj4+Cj4+IFNvIEkgY2FuIGNvbnRp
bnVlIHRvIGJ1aWxkIGEga2VybmVsIHdpdGggc29tZSBhcHByb3ByaWF0ZSBDT05GSUcgc2V0IHRv
Cj4+IHksIGJvb3QgaXQgdW5kZXIgdmlydC1tZSwgcnVuIGRtZXNnIGFuZCBzZWUgaWYgSSBicm9r
ZSBwcmludGY/IFRoYXQncwo+PiB3aGF0IEkgZG8gbm93LCBhbmQgSSBkb24ndCB3YW50IHRvIGhh
dmUgdG8gc3RhcnQgdXNpbmcgc29tZSBlbnRlcnByaXN5Cj4+IGZyYW1ld29yay4KPiAKPiBJIGhh
ZCB0aGUgc2FtZSBjb25jZXJuLiBJIGhhdmUgdHJpZWQgaXQuCgpUaGFua3MgZm9yIGRvaW5nIHRo
YXQgYW5kIHJlcG9ydGluZyB0aGUgcmVzdWx0cy4KCj4gICAgICM+IG1vZHByb2JlIHByaW50Zl9r
dW5pdAo+IAo+IHByb2R1Y2VkIHRoZSBmb2xsb3dpbmcgaW4gZG1lc2c6Cj4gCj4gWyAgIDYwLjkz
MTE3NV0gcHJpbnRmX2t1bml0OiBtb2R1bGUgdmVyaWZpY2F0aW9uIGZhaWxlZDogc2lnbmF0dXJl
IGFuZC9vciByZXF1aXJlZCBrZXkgbWlzc2luZyAtIHRhaW50aW5nIGtlcm5lbAo+IFsgICA2MC45
NDIyMDldIFRBUCB2ZXJzaW9uIDE0Cj4gWyAgIDYwLjk0NTE5N10gICAgICMgU3VidGVzdDogcHJp
bnRmLWt1bml0LXRlc3QKPiBbICAgNjAuOTQ1MjAwXSAgICAgMS4uMQo+IFsgICA2MC45NTEwOTJd
ICAgICBvayAxIC0gc2VsZnRlc3QKPiBbICAgNjAuOTUzNDE0XSBvayAxIC0gcHJpbnRmLWt1bml0
LXRlc3QKPiAKPiBJIGNvdWxkIGxpdmUgd2l0aCB0aGUgYWJvdmUuIFRoZW4gSSB0cmllZCB0byBi
cmVhayBhIHRlc3QgYnkgdGhlIGZvbGxvd2luZyBjaGFuZ2U6Cj4gCj4gCj4gZGlmZiAtLWdpdCBh
L2xpYi9wcmludGZfa3VuaXQuYyBiL2xpYi9wcmludGZfa3VuaXQuYwo+IGluZGV4IDY4YWM1Zjli
OGQyOC4uMTY4OWRhZGQ3MGEzIDEwMDY0NAo+IC0tLSBhL2xpYi9wcmludGZfa3VuaXQuYwo+ICsr
KyBiL2xpYi9wcmludGZfa3VuaXQuYwo+IEBAIC0zOTUsNyArMzk1LDcgQEAgaXA0KHN0cnVjdCBr
dW5pdCAqa3VuaXR0ZXN0KQo+ICAgICAgICAgc2Euc2luX3BvcnQgPSBjcHVfdG9fYmUxNigxMjM0
NSk7Cj4gICAgICAgICBzYS5zaW5fYWRkci5zX2FkZHIgPSBjcHVfdG9fYmUzMigweDdmMDAwMDAx
KTsKPiAgCj4gLSAgICAgICB0ZXN0KGt1bml0dGVzdCwgIjEyNy4wMDAuMDAwLjAwMXwxMjcuMC4w
LjEiLCAiJXBpNHwlcEk0IiwgJnNhLnNpbl9hZGRyLCAmc2Euc2luX2FkZHIpOwo+ICsgICAgICAg
dGVzdChrdW5pdHRlc3QsICIxMjctMDAwLjAwMC4wMDF8MTI3LjAuMC4xIiwgIiVwaTR8JXBJNCIs
ICZzYS5zaW5fYWRkciwgJnNhLnNpbl9hZGRyKTsKPiAgICAgICAgIHRlc3Qoa3VuaXR0ZXN0LCAi
MTI3LjAwMC4wMDAuMDAxfDEyNy4wLjAuMSIsICIlcGlTfCVwSVMiLCAmc2EsICZzYSk7Cj4gICAg
ICAgICBzYS5zaW5fYWRkci5zX2FkZHIgPSBjcHVfdG9fYmUzMigweDAxMDIwMzA0KTsKPiAgICAg
ICAgIHRlc3Qoa3VuaXR0ZXN0LCAiMDAxLjAwMi4wMDMuMDA0OjEyMzQ1fDEuMi4zLjQ6MTIzNDUi
LCAiJXBpU3B8JXBJU3AiLCAmc2EsICZzYSk7Cj4gCj4gCj4gSXQgcHJvZHVjZWQ6Ogo+IAo+IFsg
ICA1Ni43ODY4NThdIFRBUCB2ZXJzaW9uIDE0Cj4gWyAgIDU2Ljc4NzQ5M10gICAgICMgU3VidGVz
dDogcHJpbnRmLWt1bml0LXRlc3QKPiBbICAgNTYuNzg3NDk0XSAgICAgMS4uMQo+IFsgICA1Ni43
ODg2MTJdICAgICAjIHNlbGZ0ZXN0OiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgbGliL3ByaW50Zl9r
dW5pdC5jOjc2Cj4gICAgICAgICAgICAgICAgICAgIEV4cGVjdGVkIG1lbWNtcCh0ZXN0X2J1ZmZl
ciwgZXhwZWN0LCB3cml0dGVuKSA9PSAwLCBidXQKPiAgICAgICAgICAgICAgICAgICAgICAgIG1l
bWNtcCh0ZXN0X2J1ZmZlciwgZXhwZWN0LCB3cml0dGVuKSA9PSAxCj4gICAgICAgICAgICAgICAg
ICAgICAgICAwID09IDAKPiAgICAgICAgICAgICAgICB2c25wcmludGYoYnVmLCAyNTYsICIlcGk0
fCVwSTQiLCAuLi4pIHdyb3RlICcxMjcuMDAwLjAwMC4wMDF8MTI3LjAuMC4xJywgZXhwZWN0ZWQg
JzEyNy0wMDAuMDAwLjAwMXwxMjcuMC4wLjEnCj4gWyAgIDU2Ljc5NTQzM10gICAgICMgc2VsZnRl
c3Q6IEVYUEVDVEFUSU9OIEZBSUxFRCBhdCBsaWIvcHJpbnRmX2t1bml0LmM6NzYKPiAgICAgICAg
ICAgICAgICAgICAgRXhwZWN0ZWQgbWVtY21wKHRlc3RfYnVmZmVyLCBleHBlY3QsIHdyaXR0ZW4p
ID09IDAsIGJ1dAo+ICAgICAgICAgICAgICAgICAgICAgICAgbWVtY21wKHRlc3RfYnVmZmVyLCBl
eHBlY3QsIHdyaXR0ZW4pID09IDEKPiAgICAgICAgICAgICAgICAgICAgICAgIDAgPT0gMAo+ICAg
ICAgICAgICAgICAgIHZzbnByaW50ZihidWYsIDIwLCAiJXBpNHwlcEk0IiwgLi4uKSB3cm90ZSAn
MTI3LjAwMC4wMDAuMDAxfDEyNycsIGV4cGVjdGVkICcxMjctMDAwLjAwMC4wMDF8MTI3Jwo+IFsg
ICA1Ni44MDA5MDldICAgICAjIHNlbGZ0ZXN0OiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgbGliL3By
aW50Zl9rdW5pdC5jOjEwOAo+ICAgICAgICAgICAgICAgICAgICBFeHBlY3RlZCBtZW1jbXAocCwg
ZXhwZWN0LCBlbGVuKzEpID09IDAsIGJ1dAo+ICAgICAgICAgICAgICAgICAgICAgICAgbWVtY21w
KHAsIGV4cGVjdCwgZWxlbisxKSA9PSAxCj4gICAgICAgICAgICAgICAgICAgICAgICAwID09IDAK
PiAgICAgICAgICAgICAgICBrdmFzcHJpbnRmKC4uLiwgIiVwaTR8JXBJNCIsIC4uLikgcmV0dXJu
ZWQgJzEyNy4wMDAuMDAwLjAwMXwxMjcuMC4wLjEnLCBleHBlY3RlZCAnMTI3LTAwMC4wMDAuMDAx
fDEyNy4wLjAuMScKPiBbICAgNTYuODA2NDk3XSAgICAgbm90IG9rIDEgLSBzZWxmdGVzdAo+IFsg
ICA1Ni44MDY0OTddIG5vdCBvayAxIC0gcHJpbnRmLWt1bml0LXRlc3QKPiAKPiB3aGlsZSB0aGUg
b3JpZ2luYWwgY29kZSB3b3VsZCBoYXZlIHdyaXR0ZW4gdGhlIGZvbGxvd2luZyBlcnJvciBtZXNz
YWdlczoKPiAKPiBbICAgOTUuODU5MjI1XSB0ZXN0X3ByaW50ZjogbG9hZGVkLgo+IFsgICA5NS44
NjAwMzFdIHRlc3RfcHJpbnRmOiB2c25wcmludGYoYnVmLCAyNTYsICIlcGk0fCVwSTQiLCAuLi4p
IHdyb3RlICcxMjcuMDAwLjAwMC4wMDF8MTI3LjAuMC4xJywgZXhwZWN0ZWQgJzEyNy0wMDAuMDAw
LjAwMXwxMjcuMC4wLjEnCj4gWyAgIDk1Ljg2MjYzMF0gdGVzdF9wcmludGY6IHZzbnByaW50Zihi
dWYsIDYsICIlcGk0fCVwSTQiLCAuLi4pIHdyb3RlICcxMjcuMCcsIGV4cGVjdGVkICcxMjctMCcK
PiBbICAgOTUuODY0MTE4XSB0ZXN0X3ByaW50Zjoga3Zhc3ByaW50ZiguLi4sICIlcGk0fCVwSTQi
LCAuLi4pIHJldHVybmVkICcxMjcuMDAwLjAwMC4wMDF8MTI3LjAuMC4xJywgZXhwZWN0ZWQgJzEy
Ny0wMDAuMDAwLjAwMXwxMjcuMC4wLjEnCj4gWyAgIDk1Ljg2NjU4OV0gdGVzdF9wcmludGY6IGZh
aWxlZCAzIG91dCBvZiAzODggdGVzdHMKPiAKPiAKPiBFdmVuIHRoZSBlcnJvciBvdXRwdXQgaXMg
YWNjZXB0YWJsZSBmb3IgbWUuCgpVcmdoLiBZZWFoLCBwZXJoYXBzLCBidXQgdGhlIG9yaWdpbmFs
IGlzIG11Y2ggbW9yZSByZWFkYWJsZTsgaXQgcmVhbGx5CmRvZXNuJ3QgbWF0dGVyIHRoYXQgYSBt
ZW1jbXAoKSBmYWlscyB0byBjb21wYXJlIGVxdWFsIHRvIDAsIHRoYXQncwptZXJlbHkgaG93IHdl
IGZpZ3VyZWQgb3V0IHRoYXQgdGhlIG91dHB1dCB3YXMgd3JvbmcuCgoKSSBhbSBqdXN0IGN1cmlv
dXMgd2h5Cj4gdGhlIDJuZCBmYWlsdXJlIGlzIGRpZmZlcmVudDoKPiAKPiAgICArIG9yaWdpbmFs
IGNvZGU6IHZzbnByaW50ZihidWYsIDYsICIlcGk0fCVwSTQiLCAuLi4pIHdyb3RlICcxMjcuMCcs
IGV4cGVjdGVkICcxMjctMCcKPiAgICArIGt1bml0IGNvZGU6IHZzbnByaW50ZihidWYsIDIwLCAi
JXBpNHwlcEk0IiwgLi4uKSB3cm90ZSAnMTI3LjAwMC4wMDAuMDAxfDEyNycsIGV4cGVjdGVkICcx
MjctMDAwLjAwMC4wMDF8MTI3JyAgIAoKVGhhdCdzIGJ5IGRlc2lnbi4gSWYgeW91IHJlYWQgdGhl
IGNvZGUsIHRoZXJlJ3MgYSBjb21tZW50IHRoYXQgc2F5cyB3ZQpkbyBldmVyeSB0ZXN0IGNhc2Ug
Zm91ciB0aW1lczogV2l0aCBhIGJ1ZmZlciB0aGF0IGlzIGxhcmdlIGVub3VnaCB0byBkbwp0aGUg
d2hvbGUgb3V0cHV0LCB3aXRoIGEgMCBzaXplIGJ1ZmZlciAodGhhdCdzIGVzc2VudGlhbCB0byBh
bGxvd2luZwprYXNwcmludGYgdG8ga25vdyBob3cgbXVjaCB0byBhbGxvY2F0ZSksICB3aXRoIGt2
YXNwcmludGYgLSBidXQgYWxzbwp3aXRoIGEgYnVmZmVyIHNpemUgdGhhdCdzIGd1YXJhbnRlZWQg
dG8gZW5zdXJlIHRoZSBvdXRwdXQgZ2V0cyB0cnVuY2F0ZWQKc29tZXdoZXJlLiBBbmQgdGhhdCBz
aXplIGlzIGNob3NlbiByYW5kb21seSAtIEkgZ3Vlc3Mgb25lIGNvdWxkIHRlc3QKZXZlcnkgc2lu
Z2xlIGJ1ZmZlciBzaXplIGJldHdlZW4gMCBhbmQgZWxlbisxLCBidXQgdGhhdCdzIG92ZXJraWxs
LgoKTm93IEkgc2hvdWxkIHByb2JhYmx5IGhhdmUgbWFkZSB0aGUgdGVzdHMgZGV0ZXJtaW5pc3Rp
YyBpbiB0aGUgc2Vuc2Ugb2YKZ2V0dGluZyBhIHJhbmRvbSBzZWVkIGZvciBhIFBSTkcsIHByaW50
aW5nIHRoYXQgc2VlZCBhbmQgYWxsb3dpbmcgYQptb2R1bGUgcGFyYW1ldGVyIHRvIHNldCB0aGUg
c2VlZCBpbiBvcmRlciB0byByZXBlYXQgdGhlIGV4YWN0IHNhbWUKdGVzdHMuIEJ1dCBzbyBmYXIg
SSBoYXZlbid0IHJlYWxseSBzZWVuIGFueSBidWdzIGNhdWdodCBieSB0ZXN0X3ByaW50Zgp3aGlj
aCB3b3VsZCBoYXZlIGJlZW4gZWFzaWVyIHRvIGZpeCB3aXRoIHRoYXQuCgpUaGUgcmVhc29uIEkg
YWRkZWQgdGhhdCAiY2hvcCBpdCBvZmYgc29tZXdoZXJlIHJhbmRvbWx5IiB3YXMsIElJUkMsIGR1
ZQp0byBzb21lICVwIGV4dGVuc2lvbnMgdGhhdCBiZWhhdmVkIHJhdGhlciB3ZWlyZGx5IGRlcGVu
ZGluZyBvbiB3aGV0aGVyCnRoZXJlIHdhcyBlbm91Z2ggcm9vbSBsZWZ0IG9yIG5vdCwgYnV0IEkg
Zml4ZWQgdGhvc2UgYnVncyBiZWZvcmUKY3JlYXRpbmcgdGVzdF9wcmludGYgKGFuZCB0aGV5IHdl
cmUgaW4gdHVybiB0aGUgcmVhc29uIGZvciBjcmVhdGluZwp0ZXN0X3ByaW50ZikuIFNlZSBmb3Ig
ZXhhbXBsZSA0MTQxNmYyMzMwLCB3aGVyZSAlcEUgYXQgdGhlIGJlZ2lubmluZyBvZgp0aGUgZm9y
bWF0IHN0cmluZyB3b3VsZCB3b3JrIG9rLCBidXQgaWYgYW55dGhpbmcgcHJlY2VkZWQgaXQgYW5k
IHRoZQpidWZmZXIgd2FzIHRvbyBzbWFsbCB3ZSdkIGNyYXNoLgoKPiAKPiBJIGFtIGFsc28gYSBi
aXQgc2NhcmVkIGJ5IHRoZSBmb2xsb3dpbmcgbm90ZSBhdAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2Rldi10b29scy9rdW5pdC9zdGFydC5odG1sI3J1bm5pbmctdGVz
dHMtd2l0aG91dC10aGUta3VuaXQtd3JhcHBlcgo+IAo+ICAgICJLVW5pdCBpcyBub3QgZGVzaWdu
ZWQgZm9yIHVzZSBpbiBhIHByb2R1Y3Rpb24gc3lzdGVtLCBhbmQgaXTigJlzCj4gICAgcG9zc2li
bGUgdGhhdCB0ZXN0cyBtYXkgcmVkdWNlIHRoZSBzdGFiaWxpdHkgb3Igc2VjdXJpdHkgb2YgdGhl
Cj4gICAgc3lzdGVtLiIKPiAKPiBXaGF0IGRvZXMgaXQgbWVhbiB0aGF5IGl0IG1pZ2h0IHJlZHVj
ZSBzdGFiaWxpdHkgb3Igc2VjdXJpdHk/Cj4gSXMgaXQgYmVjYXVzZSB0aGUgdGVzdHMgbWlnaHQg
Y2F1c2UgcHJvYmxlbXM/Cj4gT3IgYmVjYXVzZSB0aGUga3VuaXQgZnJhbWV3b3JrIG1vZGlmaWVz
IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIHJ1bm5pbmcKPiBzeXN0ZW0gYWxsIHRoZSB0aW1lPwoKSG0s
IHllYWgsIHRoYXQgc291bmRzIGEgbGl0dGxlIGZyaWdodGVuaW5nLgoKUmFzbXVzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50
ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
