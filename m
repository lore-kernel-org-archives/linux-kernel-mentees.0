Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1176AC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:09:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75087206E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/eCGJsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75087206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 431C32E0E4;
	Sat, 31 Oct 2020 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxRczrNzAYHp; Sat, 31 Oct 2020 21:09:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E076520369;
	Sat, 31 Oct 2020 21:09:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2706C0859;
	Sat, 31 Oct 2020 21:09:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D67EAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BADA387625
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOqBoCGFGkql
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4BCD87546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:08:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w65so7900573pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=STFCbYRPv2yU83dYWIC6SPt0n63+PWxDCXwz4hu1xak=;
 b=c/eCGJsVgWFUksm6BHkLj9nLhlxEpWl9gT+5F3PMnaixPTok1DOkQsDQKGkGieH2GW
 xnF46V6rRJOYpxQyZ0CdgKAo60fGtUjvmRcOubxqufM6E6AQqri1GVZf3uqtKrQCF8lN
 QQqevMdCv4yggljJDQtdmOMi5V7CmumSOchQ6VsM8bO1JlThZrOGDWBH/WKXXLOgt9Jd
 V4a3ch0amAZRsRp1+bMMD+gvw0VavrOwkA/Q+01+mMQ/B/yufgaXdIa0KAuEumKBklH7
 Mb80nLW5cFdwrCjXIrwgvW7+YYA8JH8ygLgiQ8Sog+gu0lmm5yb+TwyThVPftLtU605T
 N/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=STFCbYRPv2yU83dYWIC6SPt0n63+PWxDCXwz4hu1xak=;
 b=gMxbK2pL/HpmigjhxVCncRs2tYcW+axjgfsgu1ilAE/Rjfu9sQfbo92iBHNvpB3i4A
 kRTOc/vuXkV/RTzrxfMwFNGmrlSaZJkr2zM8zxsrefuYG1Peo9oMTLRABASNkYoasCEn
 p+CuEHhN6AROgzwmIwa/fJCEMQgIqzWfp35ltfmr+8gkxkBU/OuFHjw66x1LZ3OSJFXA
 xMzrCl216uTZkO5Rl3Sj1OXhnfbAZIjmKcBWmWe/i1KXfp89Z/XLMZGaNZJmW6iXlCUa
 a/FLkmURZyLWRBRjg7pcyBkkYPmrSSNSYmHT/Op432VQo8nBDmmkNKzYCY5n30JmrDJx
 OIGg==
X-Gm-Message-State: AOAM532s7o07IuuZz5upPkTJtJ8GigiQuM2reL+tp8Feqsj3zPQ+vQpi
 JT7CaVxvt1xshijGnHL2Ya4=
X-Google-Smtp-Source: ABdhPJydIc1aJXg3z4heRq0M4C3WTx7YSJXFcX+kYPrqA7M6r6aVGuWlsnjSeWhcABlfmL0mXfJpfQ==
X-Received: by 2002:a62:6885:0:b029:164:51c0:b849 with SMTP id
 d127-20020a6268850000b029016451c0b849mr11628609pfc.58.1604178538034; 
 Sat, 31 Oct 2020 14:08:58 -0700 (PDT)
Received: from ?IPv6:2405:201:9004:6856:950f:2c13:9e63:dda0?
 ([2405:201:9004:6856:950f:2c13:9e63:dda0])
 by smtp.gmail.com with ESMTPSA id n5sm9576182pfa.156.2020.10.31.14.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 14:08:57 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201030090704.40533-1-dwaipayanray1@gmail.com>
 <9d5c8699f94481ab5bf2d37348199ca1d6343c8b.camel@perches.com>
 <alpine.DEB.2.21.2010301255460.16621@felia>
 <8b9beccf81735f2e042447026a1043f8d21c2566.camel@perches.com>
 <CABJPP5Ca8SNGmoE7GVc0OBotFhA6mLuX46QQETiVcQwTKHRosA@mail.gmail.com>
 <8b6d8af8ef3e3499f647c5895c79891e0b26ac6c.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <ba6d66ee-4470-afe9-da1d-790dc3b318fc@gmail.com>
Date: Sun, 1 Nov 2020 02:38:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8b6d8af8ef3e3499f647c5895c79891e0b26ac6c.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: improve handling of
	email comments
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

Cj4gVHJ5IHRoaXMgZ2l0IGxvZyBncmVwOgo+Cj4gJCBnaXQgbG9nIC0tZm9ybWF0PWVtYWlsIC0x
MDAwMDAgfCBcCj4gICAgZ3JlcCAtUCAnXig/Oltcd1wtXSstYnk6fGNjOnxDQzp8Q2M6KScgfCBc
Cj4gICAgZ3JlcCAtdiAnc3RhYmxlXEAnIHwgXAo+ICAgIGdyZXAgLVAgJ1w+LisnCj4KPiBUaGlz
IGZpbmRzIGFueSBzaWduYXR1cmUvY2MgbGluZSB3aXRoIGNvbnRlbnQgYWZ0ZXIgYW4KPiBlbWFp
bCBhZGRyZXNzIHRoYXQgZW5kIHdpdGggYSBjbG9zZSBhbmdsZSBicmFja2V0IHRoYXQKPiBkb2Vz
bid0IGdvIHRvIHRoZSBzdGFibGUgYWRkcmVzcy4KPgo+IFRoaW5rIGFib3V0IHdoYXQgY29udGVu
dCBhZnRlciB0aGF0IGNsb3NlIGFuZ2xlIGJyYWNrZXQKPiBzaG91bGQgYW5kIHNob3VkIG5vdCBi
ZSBhbGxvd2VkLgo+Cj4gVGhlcmUgYXJlIGEgZmV3IHZhcmlhbnRzIGhlcmU6Cj4KPiBvIGNvbW1l
bnRzIChvcHRpb25hbCB3aGl0ZXNwYWNlLCBmb2xsb3dlZCBieSAnIycgb3IgJ1snIG9yICcoJyBv
ciBjODkpCj4gbyBtaXN1c2Ugb2YgcXVvdGUgKGFyb3VuZCB0aGUgd2hvbGUgbmFtZSBhbmQgYWRk
cmVzcykKPiBvIE9kZCBjb21tYXMgYWZ0ZXIgJz4nIGxpa2VseSBmcm9tIGRlZmVjdGl2ZSBjdXQn
bidwYXN0ZSB1c2UKPgo+IFRoZW4gYWRkIHRoaXMgdG8gdGhlIGZpcnN0IGdyZXAgdG8gYXZvaWQg
dGhlIGNvbW1lbnRzIGFzIGFib3ZlCj4KPiAkIGdpdCBsb2cgLS1mb3JtYXQ9ZW1haWwgLTEwMDAw
MCB8IFwKPiAgICBncmVwIC1QICdeKD86W1x3XC1dKy1ieTp8Y2M6fENDOnxDYzopJyB8IFwKPiAg
ICBncmVwIC12ICdzdGFibGVcQCcgfCBcCj4gICAgZ3JlcCAtUCAnXD4uKycgfCBcCj4gICAgZ3Jl
cCAtdlAgJ1w+XHMqKD86XCN8XCh8L1wqfFxbKScKPgo+IFNob3VsZG4ndCBhbGwgdGhlc2UgYmUg
cmVwb3J0ZWQ/Cj4gQXJlIHRoZXkgaWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkPwo+Cj4gVGhlbiBs
b29rIGF0IHRoZSBhZGRyZXNzZXMgdGhhdCBkbyBub3QgaGF2ZSBhIGNsb3NlIGFuZ2xlCj4gYnJh
Y2tldCBhbmQgYWxzbyBoYXZlIG1vcmUgY29udGVudCBhZnRlciB0aGUgZW1haWwgYWRkcmVzcy4K
Pgo+ICQgZ2l0IGxvZyAtLWZvcm1hdD1lbWFpbCAtMTAwMDAwIHwgXAo+ICAgIGdyZXAgLVAgJ14o
PzpbXHdcLV0rLWJ5OnxjYzp8Q0M6fENjOiknIHwgXAo+ICAgIGdyZXAgLXYgJ3N0YWJsZUAnIHwg
XAo+ICAgIGdyZXAgLXZQICc8W1x3XC5cQFwrXC1dKz4nIHwgXAo+ICAgIGdyZXAgLXZQICdbXHdc
LlxAXCtcLV0rJCcKPgo+IFdoYXQgb2YgYWxsIG9mIHRoZXNlIHNob3VsZCBiZSByZXBvcnRlZD8K
Pgo+IEhhcHB5IHRlc3RpbmcuLi4KPgpIaSwKU28gSSByYW4gdGhlIHRlc3RzIGFuZCB0aGVyZSBh
cmUgc29tZSBpbnRlcmVzdGluZyByZXN1bHRzLgoKVGhlIHdhcm5pbmdzIHdlcmUgdGhlIHNhbWUg
YmVmb3JlIGFuZCBhZnRlciB0aGlzIHBhdGNoCndhcyBhcHBsaWVkLgoKRm9yIGlsbGVnYWwgZWxl
bWVudHMgYWZ0ZXIgdGhlIGNsb3NpbmcgYnJhY2VzLCB0aGVyZSB3ZXJlCnNldmVyYWwgZXJyb3Jz
IGZvciB3aGljaCBubyB3YXJuaW5ncyB3ZXJlIHJlcG9ydGVkLiBUaGVzZQphcmU6CgogwqDCoMKg
wqDCoCA2IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+LAogwqDCoMKg
wqDCoCA1IFJldmlld2VkLWJ5OiAiRGlldG1hciBFZ2dlbWFubiA8ZGlldG1hci5lZ2dlbWFubkBh
cm0uY29tPiIKIMKgwqDCoMKgwqAgMSBTdWdnZXN0ZWQtYnk6IEp1bGlhIExhd2FsbCA8anVsaWEu
bGF3YWxsQGxpcDYuZnI+LgogwqDCoMKgwqDCoCAxIFNpZ25lZC1vZmYtYnk6IFZpc2hhbCBLdWxr
YXJuaSA8dmlzaGFsQGNoZWxzaW8uY29tPiIKIMKgwqDCoMKgwqAgMSBTaWduZWQtb2ZmLWJ5OiBW
aXNoYWwgS3Vsa2FybmkgPHZpc2hhbEBjaGVsc2lvLmNvbT4iCiDCoMKgwqDCoMKgIDEgU2lnbmVk
LW9mZi1ieTogVmlzaGFsIEt1bGthcm5pIDx2aXNoYWxAY2hlbHNpby5jb20+IgogwqDCoMKgwqDC
oCAxIFNpZ25lZC1vZmYtYnk6IFZlZXJhYmhhZHJhcmFvIEJhZGlnYW50aSAKPHZiYWRpZ2FuQGNv
ZGVhdXJvcmEub3JnPiBMaW5rOgogwqDCoMKgwqDCoCAxIFNpZ25lZC1vZmYtYnk6IEppbmdsZSBX
dSA8amluZ2xlLnd1QGVtYy5jb20udHc+LgogwqDCoMKgwqDCoCAxIFJldmlld2VkLWJ5OiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPiwKIMKgwqDCoMKgwqAg
MSBSZXZpZXdlZC1ieTogTWF4IEd1cnRvdm95IDxtYXhnQG1lbGxhbm94LmNvbSAKPG1haWx0bzpt
YXhnQG1lbGxhbm94LmNvbT4+CiDCoMKgwqDCoMKgIDEgUmV2aWV3ZWQtYnk6IE1hdWxpayBTaGFo
IDxta3NoYWhAY29kZWF1cm9yYS5vcmc+IFRoYW5rcywgTWF1bGlrCiDCoMKgwqDCoMKgIDEgUmV2
aWV3ZWQtYnk6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IExpbms6IApodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjAwODI2MTEyMzMxLjA0NzkxNzYwM0BsaW51dHJvbml4LmRlCiDC
oMKgwqDCoMKgIDEgUmV2aWV3ZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBzdXNlLmNvbT5p
CiDCoMKgwqDCoMKgIDEgUmV2aWV3ZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBzdXNlLmNv
bT5jCiDCoMKgwqDCoMKgIDEgUmV2aWV3ZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBzdXNl
LmNvbT4zCiDCoMKgwqDCoMKgIDEgUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiwKIMKgwqDCoMKgwqAgMSBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3IgYm90aC4KIMKgwqDCoMKgwqAgMSBSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KIMKgwqDCoMKg
wqAgMSBSZXBvcnRlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Pgog
wqDCoMKgwqDCoCAxIFJlcG9ydGVkLWJ5OiBRaWFuIENhaSA8Y2FpQHJlZGhhdC5jb20+PgogwqDC
oMKgwqDCoCAxIFJlcG9ydGVkLWJ5OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gd3JpdGVzOgogwqDC
oMKgwqDCoCAxIFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4g
Zm9yIG1pc3NpbmcgI2luY2x1ZGUKIMKgwqDCoMKgwqAgMSBSZXBvcnRlZC1ieTogImtlcm5lbGNp
Lm9yZyBib3QiIDxib3RAa2VybmVsY2kub3JnPiIKIMKgwqDCoMKgwqAgMSBSZXBvcnRlZC1ieTog
a2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+XQogwqDCoMKgwqDCoCAxIFJlcG9ydGVk
LWJ5OiBCb2IgU2FuZGVycyA8Ym9iLnNhbmRlcnNAaHBlLmNvbT4gYW5kIHRoZSBMVFAgCnRlc3Rz
dWl0ZQogwqDCoMKgwqDCoCAxIENjOiBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPiwKIMKg
wqDCoMKgwqAgMSBDYzogVmFsZGlzIEtsZXRuaWVrcyA8dmFsZGlzLmtsZXRuaWVrc0B2dC5lZHU+
LAogwqDCoMKgwqDCoCAxIENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXgu
aW50ZWwuY29tPiwKIMKgwqDCoMKgwqAgMSBDQzogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+LAogwqDCoMKgwqDCoCAxIENjOiBTaWEsIEplZSBIZW5nIDxqZWUuaGVuZy5z
aWFAaW50ZWwuY29tPjsgCmFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgCmNsYW5nLWJ1aWx0LWxpbnV4QGdvb2dsZWdyb3Vwcy5jb207IE5h
dGhhbiBDaGFuY2VsbG9yIAo8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgogwqDCoMKgwqDCoCAx
IENjOiBSb2JlcnQgU2VzZWsgPHJzZXNla0Bnb29nbGUuY29tPiwKIMKgwqDCoMKgwqAgMSBDQzog
UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiwKIMKgwqDCoMKgwqAgMSBDYzog
T21hciBTYW5kb3ZhbCA8b3NhbmRvdkBmYi5jb20+LAogwqDCoMKgwqDCoCAxIENjOiBNaWNoYWVs
IE5ldWxpbmcgPG1pa2V5QG5ldWxpbmcub3JnPiA8bWlrZXlAbmV1bGluZy5vcmc+CiDCoMKgwqDC
oMKgIDEgQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4sCiDCoMKgwqDCoMKg
IDEgQ2M6ICJNYXJ0aW4gSy4gUGV0ZXJzZW4iIDxtYXJ0aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT4s
CiDCoMKgwqDCoMKgIDEgQ2M6IE1hcmsgU2NvdHQgPG1zY290dEBmb3JjZXBvaW50LmNvbT4sCiDC
oMKgwqDCoMKgIDEgQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+LgogwqDC
oMKgwqDCoCAxIENjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiwKIMKgwqDC
oMKgwqAgMSBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4sCiDCoMKgwqDC
oMKgIDEgQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4sCiDCoMKgwqDCoMKgIDEgQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAZ29vZ2xlLmNvbT4s
CiDCoMKgwqDCoMKgIDEgQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4sCiDCoMKg
wqDCoMKgIDEgQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4sCiDC
oMKgwqDCoMKgIDEgQ2M6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBQYXJhdiBQ
YW5kaXQgCjxwYXJhdkBtZWxsYW5veC5jb20+OyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZzsgCmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGtlcm5lbC1qYW5p
dG9yc0B2Z2VyLmtlcm5lbC5vcmcKIMKgwqDCoMKgwqAgMSBDYzogSmFubiBIb3JuIDxqYW5uaEBn
b29nbGUuY29tPiwKIMKgwqDCoMKgwqAgMSBDYzogSmFtZXMgQm90dG9tbGV5IDxqYW1lcy5ib3R0
b21sZXlAaGFuc2VucGFydG5lcnNoaXAuY29tPiwKIMKgwqDCoMKgwqAgMSBDYzogSWNlbm93eSBa
aGVuZyA8aWNlbm93eUBhb3NjLmlvPiwKIMKgwqDCoMKgwqAgMSBDYzogRGFuIE11cnBoeSA8ZG11
cnBoeUB0aS5jb20+QQogwqDCoMKgwqDCoCAxIENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+LAogwqDCoMKgwqDCoCAxIENjOiBDaHJpc3RvcGggTGFtZXRlciA8Y2xAbGludXguY29t
PkNjOiBQZWtrYSBFbmJlcmcgCjxwZW5iZXJnQGtlcm5lbC5vcmc+CiDCoMKgwqDCoMKgIDEgQ2M6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiwKIMKgwqDCoMKgwqAgMSBDYzogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KIMKgwqDCoMKgwqAgMSBDQzog
IkNoYW5nIFMuIEJhZSIgPGNoYW5nLnNlb2suYmFlQGludGVsLmNvbT4sCiDCoMKgwqDCoMKgIDEg
Q2M6IEFsIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPmUKIMKgwqDCoMKgwqAgMSBBY2tl
ZC1ieTogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT5BCiDC
oMKgwqDCoMKgIDEgQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+QQoKCkZvciBjYXNlcyB3aXRoIG5vIGNsb3NpbmcgJz4nLCBmb2xsb3dpbmcgY2FzZXMg
d2VyZSBub3QKcmVwb3J0ZWQgYnkgY2hlY2twYXRjaDoKCiDCoMKgwqDCoMKgIDYgQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywKIMKgwqDCoMKgwqAgMSBSZXZpZXdlZC1i
eTogTWF4IEd1cnRvdm95IDxtYXhnQG1lbGxhbm94LmNvbSAKPG1haWx0bzptYXhnQG1lbGxhbm94
LmNvbT4+CiDCoMKgwqDCoMKgIDEgQ2M6IHJvc3RlZHRAZ29vZG1pcy5vcmcsCiDCoMKgwqDCoMKg
IDEgQ2M6IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZywKIMKgwqDCoMKgwqAgMSBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywKClNvIGl0J3MgbW9zdGx5IGV4dHJhIGNv
bW1hcyBhdCB0aGUgZW5kLiBCdXQgb3RoZXIKaWxsZWdhbCBjaGFyYWN0ZXJzIHdlcmUgYWxzbyB0
aGVyZS4gQWxzbyBpbiBvbmUgb3IgdHdvCmNhc2VzLCBtdWx0aXBsZSBhZGRyZXNzZXMgd2VyZSBz
dGFja2VkIHRvZ2V0aGVyLgpJIHRoaW5rIHRoZXNlIGFsbCBkZXNlcnZlIHRvIGJlIHJlcG9ydGVk
LgoKVGhhbmtzLApEd2FpcGF5YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
