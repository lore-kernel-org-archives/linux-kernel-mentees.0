Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD155C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 19:15:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2656620E65
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 19:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3R3ffmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2656620E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4287871FF;
	Fri, 23 Oct 2020 19:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6TqtvNaWZ2V; Fri, 23 Oct 2020 19:15:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEB33871FD;
	Fri, 23 Oct 2020 19:15:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2FE2C088B;
	Fri, 23 Oct 2020 19:15:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1021C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 752EB20770
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNirVMN1a7Du
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 46EB22011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:15:12 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l18so2038561pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KzL5VVv9OBTE8cblb6xc9qq9hjO17uW0mb/l3hbABK8=;
 b=T3R3ffmKYTWAmta7ZNbr9pjO+4nVjqBUiHz+11QNzUW4zabMSWsW5/5bfdR+p5FLbK
 iGr7AfcuXf6t5YGpJsJ1XcSK8rYkTWtxt/or9cVbFLHYrktaZbi7SCqqN3odTeSZnNWo
 keFGZgB+p1ULtiVPznwAcZdzwmpHgsVi456s7SyFRifx116kygD3JflHPOb3+XvEaj9e
 HSzwbcFHW01IABmjsmhjdkOl/HnhM+YFO0+bnrow8zihgql5CYPbCsZJQSk697j6Xgfq
 6zqilTWuduJkwoXWvNMfRICZhByyzTCsvskfO6ulJsnG/Si55V486uv46wNaVPPYtjcA
 gQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KzL5VVv9OBTE8cblb6xc9qq9hjO17uW0mb/l3hbABK8=;
 b=E2NUFS48khNErm3r+eoFHXZigxePJbdGEa95Tfk27PRHWheh2d0wydeafOqj2N6SCj
 EL7LC/rB9Fm2/cHfIWgO7iDWicRmymBat16/d+8coJqe1bHDRz6iH4ORJeulmVri0eWE
 4MgyzDx7HCWrOmZ14z38F5BFMVP62xN/vMExOHaViuacz9/UNIwnFSbINGK2JOc3gfAK
 6yRfn5fPDSB8PabrDgFopTSDwk5dQIwxONsJILzSsyTkb/7Ayvwut0SBHvqRYjyOfWBh
 2Ezf4YC/AJvoIz3O7NosOYDbkEy4nnwNzTHgTz5n4bXfEIshZr4dZ9r+HCn7R9xAgJB5
 bo7w==
X-Gm-Message-State: AOAM532TbRitENII1HSoDupBttGwDfLAN8AJ8AbIm2n+rCy6k2oicnYD
 UMXoRLQJjJY98d45AnmdT4c=
X-Google-Smtp-Source: ABdhPJzdQhYD+xPo2N0v/aeawiojXa1CbWlFTZZ1TjsHko5jmUEIdQu2Rs7qAbj+nQrIf+doGKxoiQ==
X-Received: by 2002:a62:1844:0:b029:152:80d3:8647 with SMTP id
 65-20020a6218440000b029015280d38647mr631613pfy.18.1603480511546; 
 Fri, 23 Oct 2020 12:15:11 -0700 (PDT)
Received: from ?IPv6:2405:201:9004:6890:ae4b:a0f8:1bbb:ec51?
 ([2405:201:9004:6890:ae4b:a0f8:1bbb:ec51])
 by smtp.gmail.com with ESMTPSA id t13sm3052594pfc.1.2020.10.23.12.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 12:15:11 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
 <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
 <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
 <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <2a3b90ee-b9bd-2586-9d68-45cbf7e499a9@gmail.com>
Date: Sat, 24 Oct 2020 00:44:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
 attributes check to handle more patterns
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

Cj4+PiBBbmQgeW91IGNvdWxkIGNoZWNrIHVzaW5nCj4+Pgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAk
bGluZSA9fiAvX19hdHRyaWJ1dGVfX1xzKlwoXHMqKCRiYWxhbmNlZF9wYXJlbnMpXHMqKS8KPj4+
Cj4+PiBhbmQgY2hlY2sgZm9yIGFsbCBhdHRyaWJ1dGVzIGluICQxIGFmdGVyCj4+PiBzdHJpcHBp
bmcgdGhlIGxlYWRpbmcgYW5kIHRyYWlsaW5nIHBhcmVucwo+Pj4gYW5kIGFueSBsZWFkaW5nIGFu
ZCB0cmFpbGluZyB1bmRlcnNjb3Jlcwo+Pj4gZnJvbSBlYWNoIGF0dHJpYnV0ZS4KPj4+Cj4+PiBB
bmQgeW91IG9ubHkgbmVlZCBvbmUgaGFzaCBhbmQgeW91IHNob3VsZAo+Pj4gY2hlY2sgZm9yIGV4
aXN0ZW5jZSBvZiB0aGUga2V5IHJhdGhlciB0aGFuCj4+PiBoYXZlIG11bHRpcGxlIGxpc3RzLgo+
Pj4KPj4+ICDCoMKgwqDCoMKgwqDCoMKgaWYgKGV4aXN0cygkYXR0cmlidXRlcygkYXR0cikpKSB7
Cj4+Pgo+PiBPa2F5IHRoYW5rcyEKPj4gQnV0IHdoYXQgc2hvdWxkIGJlIGRvbmUgZm9yIHRoZSBh
dHRyaWJ1dGVzIHdoaWNoIGFyZQo+PiBwYXJhbWV0ZXJpemVkLCBsaWtlIF9fYWxpZ25lZF9fKHgp
LiBTaG91bGQgYWxsIHRoZSBfXwo+PiBmb3IgdGhlc2UgZW50cmllcyBiZSB0cmltbWVkIHRvbz8K
PiB5ZXMKPgo+PiBUaGVyZSBhcmUgYWxzbwo+PiBjYXNlcyB3aGVyZSB0aGVyZSBhcmUgbXVsdGlw
bGUgdmVyc2lvbnMgbGlrZToKPj4KPj4gX19hbGlnbmVkX18KPj4gX19hbGlnbmVkX18oeCkKPiAk
IGdpdCBncmVwIF9fYWxpZ25lZF9fIHwgZ3JlcCAtdiAtUCAnX19hbGlnbmVkX19ccypcKCcKPgo+
IEFGQUlLOiBUaGVyZSBpcyBvbmx5IG9uZSB1c2Ugb2YgYmFyZSBfX2FsaWduZWRfXyBhbmQKPiB0
aGF0J3MgaW4gY29tcGlsZXJfYXR0cmlidXRlcy5oCj4KPj4gVG8gaGVscCBkaWZmZXJlbnRpYXRl
IGJldHdlZW4gdGhlbSB3aGF0IGNhbiBiZSBkb25lPwo+PiBTaG91bGQgaSBtYWtlIHRoZSBrZXlz
IGFzOgo+Pgo+PiBhbGlnbmVkCj4+IGFsaWduZWRfXygKPj4KPj4gaW5zdGVhZCBvZgo+Pgo+PiBf
X2FsaWduZWRfXwo+PiBfX2FsaWduZWRfXygKPiBKdXN0IHVzZSBhbGlnbmVkCj4KPiBKdXN0IGZ5
aToKPgo+IHRoZXNlIGFyZSB0aGUgdXNlcyBvZiBfX2F0dHJpYnV0ZV9fIGluIHRoZSBrZXJuZWwK
PiB3aXRoIGFsbCB0aGUgdW5kZXJzY29yZXMgYW5kIHNwYWNlcyByZW1vdmVkIHNvIHRoZXJlJ3MK
PiBzb21lIHZhbHVlIGluIGZpbmRpbmcgdGhlIG11bHRpcGxlIGFjdHVhbCBhdHRyaWJ1dGVzIC4K
CgpIaSwKSSBtb2RpZmllZCB0aGUgY2hlY2sgdG8gY2hlY2sgdGhlIGF0dHJpYnV0ZXMgZnJvbSB0
aGUgbWFwLgpUaGVyZSBhcmUgdHdvIGNoZWNrcyAtIG9uZSBmb3IgdGhlIG5vcm1hbCBhdHRyaWJ1
dGVzIGFuZApvbmUgZm9yIHRoZSBvbmVzIHdpdGggYXJndW1lbnRzLCB3aGljaCBuZWVkcyBqdXN0
IGEgYml0IG1vcmUgcHJvY2Vzc2luZy4KClNvIGF0dHJpYnV0ZXMgbGlrZSBfX3BhY2tlZF9fIGFz
IHdlbGwgYXMgdGhvc2UgbGlrZQpfX2FsaWduZWRfXyh4KSBhcmUgaGFuZGxlZC4KCldoYXQgZG8g
eW91IHRoaW5rPwoKLS0tCivCoMKgwqAgwqDCoMKgIMKgwqDCoCAkbGluZSA9fiAvX19hdHRyaWJ1
dGVfX1xzKlwoXHMqKCRiYWxhbmNlZF9wYXJlbnMpXHMqXCkvKSB7CivCoMKgwqAgwqDCoMKgIMKg
wqDCoCBteSAkYXR0ciA9IHRyaW0oJDEpOworwqDCoMKgIMKgwqDCoCDCoMKgwqAgJGF0dHIgPX4g
cy9cKFxzKl8qKC4qKVwpLyQxLzsKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIHdoaWxlKCRhdHRyID1+
IHMvKC4qKV8kLyQxLykge33CoCAjIFJlbW92ZSB0cmFpbGluZyB1bmRlcnNjb3JlcworCivCoMKg
wqAgwqDCoMKgIMKgwqDCoCBteSAlYXR0cl9saXN0ID0gKAorwqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgICJhbGlhcyLCoMKgwqAgwqDCoMKgIMKgwqDCoCA9PiAiX19hbGlhcyIsCivCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoMKgwqAgImFsaWduZWQiwqDCoMKgIMKgwqDCoCA9PiAiX19hbGlnbmVk
IiwKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAiYWx3YXlzX2lubGluZSIgwqDCoMKgID0+
ICJfX2Fsd2F5c19pbmxpbmUiLAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgICJhc3N1bWVf
YWxpZ25lZCLCoMKgwqAgPT4gIl9fYXNzdW1lX2FsaWduZWQiLAorwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgICJjb2xkIsKgwqDCoCDCoMKgwqAgwqDCoMKgID0+ICJfX2NvbGQiLAorwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgICJjb25zdCLCoMKgwqAgwqDCoMKgIMKgwqDCoCA9PiAiX19j
b25zdCIsCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgImNvcHkiwqDCoMKgIMKgwqDCoCDC
oMKgwqAgPT4gIl9fY29weSIsCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgImRlc2lnbmF0
ZWRfaW5pdCLCoMKgwqAgwqDCoMKgID0+ICJfX2Rlc2lnbmF0ZWRfaW5pdCIsCivCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgImV4dGVybmFsbHlfdmlzaWJsZSLCoMKgwqAgPT4gIl9fdmlzaWJs
ZSIsCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgImZhbGx0aHJvdWdoIsKgwqDCoCDCoMKg
wqAgPT4gImZhbGx0aHJvdWdoIiwKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAiZ251X2lu
bGluZSLCoMKgwqAgwqDCoMKgID0+ICJfX2dudV9pbmxpbmUiLAorwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgICJtYWxsb2MiwqDCoMKgIMKgwqDCoCA9PiAiX19tYWxsb2MiLAorwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgICJtb2RlIsKgwqDCoCDCoMKgwqAgwqDCoMKgID0+ICJfX21vZGUi
LAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgICJub19jYWxsZXJfc2F2ZWRfcmVnaXN0ZXJz
IiA9PiAKIl9fbm9fY2FsbGVyX3NhdmVkX3JlZ2lzdGVycyIsCivCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgIm5vY2xvbmUiwqDCoMKgIMKgwqDCoCA9PiAiX19ub2Nsb25lIiwKK8KgwqDCoCDC
oMKgwqAgwqDCoMKgIMKgwqDCoCAibm9pbmxpbmUiwqDCoMKgIMKgwqDCoCA9PiAibm9pbmxpbmUi
LAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgICJub25zdHJpbmciwqDCoMKgIMKgwqDCoCA9
PiAiX19ub25zdHJpbmciLAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgICJub3JldHVybiLC
oMKgwqAgwqDCoMKgID0+ICJfX25vcmV0dXJuIiwKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCAicGFja2VkIsKgwqDCoCDCoMKgwqAgPT4gIl9fcGFja2VkIiwKK8KgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCAicHVyZSLCoMKgwqAgwqDCoMKgIMKgwqDCoCA9PiAiX19wdXJlIiwKK8KgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAidXNlZCLCoMKgwqAgwqDCoMKgIMKgwqDCoCA9PiAiX191
c2VkIgorwqDCoMKgIMKgwqDCoCDCoMKgwqAgKTsKKworwqDCoMKgIMKgwqDCoCDCoMKgwqAgaWYg
KGV4aXN0cygkYXR0cl9saXN0eyRhdHRyfSkpIHsKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCBteSAkbmV3ID0gJGF0dHJfbGlzdHskYXR0cn07CivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgV0FSTigiUFJFRkVSX0RFRklORURfQVRUUklCVVRFX01BQ1JPIiwKK8KgwqDCoCDCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoMKgwqDCoCAiJG5ldyBpcyBwcmVmZmVyZWQgb3ZlciAKX19hdHRyaWJ1
dGVfXygoX18ke2F0dHJ9X18pKVxuIiAuICRoZXJlY3Vycik7CivCoMKgwqAgwqDCoMKgIMKgwqDC
oCB9CisKK8KgwqDCoCDCoMKgwqAgwqDCoMKgICMgQ2hlY2sgZm9yIGF0dHJpYnV0ZXMgd2l0aCBw
YXJhbWV0ZXJzLCBsaWtlIGNvcHlfXyhzeW1ib2wpCivCoMKgwqAgwqDCoMKgIMKgwqDCoCBpZiAo
JGF0dHIgPX4gLyguKilfXyhcKC4qXCkpLykgeworwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IGlmIChleGlzdHMoJGF0dHJfbGlzdHskMX0pKSB7CivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIG15ICRuZXcgPSAkYXR0cl9saXN0eyQxfTsKK8KgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgV0FSTigiUFJFRkVSX0RFRklORURfQVRUUklCVVRFX01BQ1JPIiwKK8Kg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqAgIiRuZXckMiBpcyBwcmVm
ZmVyZWQgb3ZlciAKX19hdHRyaWJ1dGVfXygoX18ke2F0dHJ9KSlcbiIgLiAkaGVyZWN1cnIpOwor
wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIH0KK8KgwqDCoCDCoMKgwqAgwqDCoMKgIH0KLS0t
CgpJZiB0aGlzIGlzIG9rYXkgSSB3b3VsZCBsaWtlIHRvIHNlbmQgaW4gYSBwcm9wZXIgdjMuCgpU
aGFua3MsCkR3YWlwYXlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
