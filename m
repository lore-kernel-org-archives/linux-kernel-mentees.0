Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42FEEB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Jul 2023 13:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 571474028D;
	Fri, 14 Jul 2023 13:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571474028D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KikFYIJF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEwBDXUitBC9; Fri, 14 Jul 2023 13:59:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 44EC840114;
	Fri, 14 Jul 2023 13:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44EC840114
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32AC9C0071;
	Fri, 14 Jul 2023 13:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82D97C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E25682EB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E25682EB6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KikFYIJF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VLFOK2vRSwX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:59:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266A482B69
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 266A482B69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:59:44 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-666eef03ebdso1258024b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689343183; x=1691935183;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RsmTs9oTdRL+oQUaB5+qqdOok+7phDWT0dYHS/RWZeo=;
 b=KikFYIJFmTkOHHXOXkNv2Q5mzv0uTAU2KSmVdvDdZKQ9kqBtVPNtyDVfw8hdQ4zcdS
 9vKGI5UPkLHhaUw3rwiUXWbS7GICgPlTFylfjSv6iCXMPxee13MJR6AU/liqJV7cFIr/
 LEk53OcJgjdVQGjDaSrodgScQOh30t++Tlw8AgMS9qahqfHBCglHvTfML7gHvU9rEvnd
 gzb/ZUqRLoiLz4eIx/52kqi5g5TpAaKIYpmd2bmZLgslAopRx7rhhGxWx+7Uyox6Y1iI
 27dLxhAbPR3JJyWazlVLhbXg2xpRf0bG3jUxFOURGlysaMtRDH+w2JQA7befRNnYqcvG
 2pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689343183; x=1691935183;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsmTs9oTdRL+oQUaB5+qqdOok+7phDWT0dYHS/RWZeo=;
 b=dVp9HvkBqIp4F8AvIUUeBoQMKbXqwUWlFaEUqL/1Q06e7di09Ke0ZsCkxDQgIY8PmP
 AeVdOWmcviL3YrCDgKaVXTaA9D+hhuXHgPyJbzq9ZGTlHV/I1YZG/cAXdqiO1tA83b9o
 kXKZhb7FkYj6jlOgN0RzW6P9+PXLlH75bCLRXvCpDzbHIxZVU6ja0Jdv9szrkCfrVQsC
 Tq8wmF8NXXHQUmI9ssqcNGfMhQf88eAdcQIUR+7SwINuezSAL92xhJkkxk1fA2TYNmdl
 mVYPRCK1ISo7JA9Gmub6rJIq04bbg2WNKQcGbN8lXou/w3tn1L4AUniLZu3JN+JTDOjS
 7LFg==
X-Gm-Message-State: ABy/qLYxgw6hhlxoGwlCPRjaqsh6XugXCgErWyZ/kpVgNRkfd+nkA312
 BNU0y8qVULf2qqkQ/IN0wZg=
X-Google-Smtp-Source: APBJJlHKk6qdFpXle20caG/zo79DIL7btJmZsrNUHubOpiMFaaMdTJ75l8XXVm8IQPI31UwHGTA9RA==
X-Received: by 2002:a05:6a00:134a:b0:682:4de1:adcc with SMTP id
 k10-20020a056a00134a00b006824de1adccmr4597237pfu.12.1689343183325; 
 Fri, 14 Jul 2023 06:59:43 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 f21-20020aa782d5000000b006829b27f252sm7382110pfn.93.2023.07.14.06.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 06:59:43 -0700 (PDT)
Message-ID: <918eb675-7a4d-a70f-7164-4c3f6b0ea235@gmail.com>
Date: Fri, 14 Jul 2023 20:59:40 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/counter: Add checking directory exists for make
 clean
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>, william.gray@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
 <8a14a99d-ce54-4fe3-ab42-e41f002080ce@linuxfoundation.org>
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <8a14a99d-ce54-4fe3-ab42-e41f002080ce@linuxfoundation.org>
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

CgpPbiA3LzE0LzIzIDAyOjQyLCBTaHVhaCBLaGFuIHdyb3RlOgo+IE9uIDcvNy8yMyAwODowOCwg
QW5oIFR1YW4gUGhhbiB3cm90ZToKPj4gcm1kaXIgcmVxdWlyZXMgdGhlIGRpcmVjdG9yeSBleGlz
dCBzbyBpdCBjYXVzZXMgIm1ha2UgLUMgdG9vbHMgY2xlYW4iCj4+IGZhaWxlZCBpZiBzb21lb25l
IG9ubHkgYnVpbGRzIG90aGVyIHRvb2xzIGJ1dCBub3QgY291bnRlci4gVGhpcyBjb21taXQKPj4g
YWRkcyBjaGVja2luZyB0aGUgZGlyZWN0b3J5IGV4aXN0IGJlZm9yZSBkb2luZyBybWRpci4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxmY0BnbWFpbC5jb20+Cj4+
IC0tLQo+PiDCoCB0b29scy9jb3VudGVyL01ha2VmaWxlIHwgNCArKystCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2NvdW50ZXIvTWFrZWZpbGUgYi90b29scy9jb3VudGVyL01ha2VmaWxlCj4+IGluZGV4
IGEwZjRjYWI3MWZlNS4uMjkwN2YzYjMwOTRiIDEwMDY0NAo+PiAtLS0gYS90b29scy9jb3VudGVy
L01ha2VmaWxlCj4+ICsrKyBiL3Rvb2xzL2NvdW50ZXIvTWFrZWZpbGUKPj4gQEAgLTQwLDcgKzQw
LDkgQEAgJChPVVRQVVQpY291bnRlcl9leGFtcGxlOiAkKENPVU5URVJfRVhBTVBMRSkKPj4gwqAg
Y2xlYW46Cj4+IMKgwqDCoMKgwqAgcm0gLWYgJChBTExfUFJPR1JBTVMpCj4+IMKgwqDCoMKgwqAg
cm0gLXJmICQoT1VUUFVUKWluY2x1ZGUvbGludXgvY291bnRlci5oCj4+IC3CoMKgwqAgcm1kaXIg
LXAgJChPVVRQVVQpaW5jbHVkZS9saW51eAo+PiArwqDCoMKgIEBpZiBbIC1kICQoT1VUUFVUKWlu
Y2x1ZGUvbGludXggXTsgdGhlbiBcCj4+ICvCoMKgwqDCoMKgwqDCoCBybWRpciAtcCAkKE9VVFBV
VClpbmNsdWRlL2xpbnV4OyBcCj4+ICvCoMKgwqAgZmkKPj4gwqDCoMKgwqDCoCBmaW5kICQob3Ig
JChPVVRQVVQpLC4pIC1uYW1lICcqLm8nIC1kZWxldGUgLW8gLW5hbWUgJ1wuKi5kJyAtZGVsZXRl
Cj4+Cj4+IMKgIGluc3RhbGw6ICQoQUxMX1BST0dSQU1TKQo+IAo+IFBsZWFzZSBjYyBhcHByb3By
aWF0ZSBsaW51eCBrZXJuZWwgbWFpbGluZyBsaXN0cyBhbmQgcmV2aWV3ZXJzLgo+IFlvdSBjYW4g
ZmluZCB0aGVtIGJ5IHJ1bm5pbmcgZ2V0X21haW50YWluZXJzLnBsIHNjcmlwdC4KPiAKPiB0aGFu
a3MsCj4gLS0gU2h1YWgKVGhhbmtzIFNodWFoLCB3aWxsIHVwZGF0ZSB0aGUgQ0MgbGlzdCBhcyB5
b3VyIHN1Z2dlc3Rpb24uCgo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
