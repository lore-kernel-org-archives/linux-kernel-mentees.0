Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FA5C2B9F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:26:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923956128A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923956128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4495183C7C;
	Sat, 22 May 2021 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFKXUSZtORxu; Sat, 22 May 2021 11:26:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EEE83BF4;
	Sat, 22 May 2021 11:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B1A7C000E;
	Sat, 22 May 2021 11:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC164C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A15B24055D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63OVcPUBH7Y6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:26:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F26AC40558
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:26:25 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id g24so12277305pji.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8kh6iJCxppwsBbpPOa+gb5iEakg7K3WV07g7y012eVI=;
 b=QN9RdDCl/yL9Bhr+K7e6V5VOzBbLcjJULkIhY+7UtQFxPiDcqcGUIDLN3zx9iEAS8j
 JAfWRIDGp6vDUilN+6B2XpYXroWBGwi13Xj9ahIw0WkqchVkzzfaO9XXAQ0etoGax7nf
 VWEJk87pR72jNJTQ6TSXkDfyly0KEv0QBq6isS2loi3JUPrtgGhIQA2XDhm/MNGMHjvG
 fGn+BSHAyGRCovQDtV1tB0IiXeB0mSCtU1zkiiABe660Gxxk2U8EFDPIP/PFXWNz1dj8
 rQxOk7sFjuDSzXyf3v5tcCY24+NUqSzmMT6bN6RxcxaHN7j5nyRcmVPwueMRabQsNQ3V
 CHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8kh6iJCxppwsBbpPOa+gb5iEakg7K3WV07g7y012eVI=;
 b=iwvp2pzaSQBpQ3oEZ9OvToQevG+J/rl0Kaxy56yZ2FeYrwDu/UeL52aOZPZnGLRVty
 tOFndzUDRfnCYPAaP7GTj6CiOY3YslRbDpm2jiA1tw6i5cfsDXQqD+BKd2YBbPH6Umji
 KwwoBLvui0qdaIL1WOCrR/rS1m/9qXUE3r+wE86bjlRhfd/8UgjSD11tHxg3zuqZcReH
 W0XVodr5lgfC+oskCMNXRwCnAl6RY2CPMWKLv1yeRZuPT9PMQua/Q16NWQnha4iSAs/v
 0qcvC3jAWyBqb+enPSKmiqlWkDKoQMoHp9czFex1S6toNWXHRdKOB5Alct9ZK3TslCEU
 NAmw==
X-Gm-Message-State: AOAM530PFux8T4YnyEPDGLLKBEcE3+yfhsEbf1gJ0n2/wdgjsQG7rTq5
 h51L1g9fCT8LIAVcETR6xlI=
X-Google-Smtp-Source: ABdhPJym71RIY1/mswIr0hXTkGC0Mmfmk+uWlyOjsnF+G20vsMcWooVOUlvDZUj5N1SgF7irx5V8/Q==
X-Received: by 2002:a17:903:1c3:b029:f1:ecf4:f971 with SMTP id
 e3-20020a17090301c3b02900f1ecf4f971mr16849834plh.6.1621682785266; 
 Sat, 22 May 2021 04:26:25 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a93f:d9c2:4477:9177:8c76?
 ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.gmail.com with ESMTPSA id t14sm6046050pfg.168.2021.05.22.04.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 04:26:24 -0700 (PDT)
Subject: Re: [PATCH] Phonet: fix kernel-doc syntax in file headers
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>
References: <20210520182159.31462-1-yashsri421@gmail.com>
 <52313028.m8L9TnScQ9@philogene>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <2970b6b6-1450-8eec-a9e9-45629af9417f@gmail.com>
Date: Sat, 22 May 2021 16:56:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <52313028.m8L9TnScQ9@philogene>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, courmisch@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMjIvNS8yMSAyOjU3IHBtLCBSw6ltaSBEZW5pcy1Db3VybW9udCB3cm90ZToKPiBMZSBqZXVk
aSAyMCBtYWkgMjAyMSwgMjE6MjE6NTkgRUVTVCBBZGl0eWEgU3JpdmFzdGF2YSBhIMOpY3JpdCA6
Cj4+IFRoZSBvcGVuaW5nIGNvbW1lbnQgbWFyayAnLyoqJyBpcyB1c2VkIGZvciBoaWdobGlnaHRp
bmcgdGhlIGJlZ2lubmluZyBvZgo+PiBrZXJuZWwtZG9jIGNvbW1lbnRzLgo+PiBUaGUgaGVhZGVy
IGZvciBpbmNsdWRlLyovbGludXgvcGhvbmV0LmggZmlsZXMgZm9sbG93cyB0aGlzIHN5bnRheCwg
YnV0Cj4+IHRoZSBjb250ZW50IGluc2lkZSBkb2VzIG5vdCBjb21wbHkgd2l0aCBrZXJuZWwtZG9j
Lgo+Pgo+PiBUaGlzIGxpbmUgd2FzIHByb2JhYmx5IG5vdCBtZWFudCBmb3Iga2VybmVsLWRvYyBw
YXJzaW5nLCBidXQgaXMgcGFyc2VkCj4+IGR1ZSB0byB0aGUgcHJlc2VuY2Ugb2Yga2VybmVsLWRv
YyBsaWtlIGNvbW1lbnQgc3ludGF4KGkuZSwgJy8qKicpLCB3aGljaAo+PiBjYXVzZXMgdW5leHBl
Y3RlZCB3YXJuaW5nIGZyb20ga2VybmVsLWRvYy4KPj4gRm9yIGUuZy4sIHJ1bm5pbmcgc2NyaXB0
cy9rZXJuZWwtZG9jIC1ub25lIGluY2x1ZGUvbGludXgvcGhvbmV0LmggZW1pdHM6Cj4+IHdhcm5p
bmc6IFRoaXMgY29tbWVudCBzdGFydHMgd2l0aCAnLyoqJywgYnV0IGlzbid0IGEga2VybmVsLWRv
YyBjb21tZW50Lgo+PiBSZWZlciBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS9rZXJuZWwtZG9jLnJz
dCAqIGZpbGUgcGhvbmV0LmgKPj4KPj4gUHJvdmlkZSBhIHNpbXBsZSBmaXggYnkgcmVwbGFjaW5n
IHRoaXMgb2NjdXJyZW5jZSB3aXRoIGdlbmVyYWwgY29tbWVudAo+PiBmb3JtYXQsIGkuZS4gJy8q
JywgdG8gcHJldmVudCBrZXJuZWwtZG9jIGZyb20gcGFyc2luZyBpdC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQWRpdHlhIFNyaXZhc3RhdmEgPHlhc2hzcmk0MjFAZ21haWwuY29tPgo+IAo+IFlvdSBj
b3VsZCBqdXN0IGFzIHdlbGwgcmVtb3ZlIHRoZSBzdHJheSAiZmlsZSBYWCIgbGluZXMgYnV0IE9L
Lgo+IAo+IEFja2VkLWJ5OiBSw6ltaSBEZW5pcy1Db3VybW9udCA8Y291cm1pc2NoQGdtYWlsLmNv
bS4+Cj4gCgoKSGkgUmVtaSBhbmQgUmFuZHkKVGhhbmtzIGZvciByZXZpZXdpbmcgOikKSSdsbCBi
ZSBzZW5kaW5nIGEgdjIgd2l0aCByZW1vdmVkIGZpbGVuYW1lcwoKVGhhbmtzCkFkaXR5YQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
