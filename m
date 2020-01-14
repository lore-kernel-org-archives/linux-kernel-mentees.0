Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23B8C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 18:35:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D44222C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 18:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py1vaP5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D44222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93C3A85F5C;
	Tue, 14 Jan 2020 18:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fa8kqPqrKeqF; Tue, 14 Jan 2020 18:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62C9385F4E;
	Tue, 14 Jan 2020 18:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F347C1D83;
	Tue, 14 Jan 2020 18:35:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90702C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 79BE8865EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otUhBvAlM1ec
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52CF386947
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:35:16 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so5569664plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:delivered-to:references
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/qE8VTxzjst+EQbNftR/5pOWATTQNxAjshuPv96FVc=;
 b=Py1vaP5GG3Yd1417fKiaCZo48+9m+eiOmt5ulhA8yxbnCZYl2K64S0ybOAJ/GNWsli
 V2vlKrHUI8H9s66MXQcRC9ScKz47/vCj0dYqsT812qRx97pYD0n4Gk51Kxlpe8654aQv
 ZaRZ7I44gEePbfHqNSTQ+53wSR4zAyyzEb48Zsg/0ytPERmvxMdCEYZ1KOfaPgTJ0hoz
 gu512D+5bX+TERQErh8BQUjwZcbPOTb3KWa9fxoB5eiB8Y9+sSVLcOejFpqwrMeA2yk5
 GPjyujV+mvAZXAyCrivFAgoj7FK7oRCtknkyBHeUG4S0Te364cGG+d+BrUezyqLepEu/
 vn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:delivered-to
 :references:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/qE8VTxzjst+EQbNftR/5pOWATTQNxAjshuPv96FVc=;
 b=NBaW11gI2oXtqoPoXDGO4f3iD5ANE9ei33Kv2v3oSNp6iC402fLp0er4zZ/T+ifkYM
 AGMLkm8KOFtYPC1cjn6t1FQyTDF3J5CzWOuhN9WGErK+O9qO6hU1kk0xXdv87DkFbyaN
 U04IORHyT3dXI1VCJPT/gzq7axAqeLkmlnca1XvVYFz3AhMRYU+KBhN+9/kSrQJMArCE
 u0Uz2xr7Pudmwv67UiX6eTaELD9wUmG0moGUDA73EN3kSXG+HzT6m6VKFoOxh+niV/vu
 /3264XIt3fzqiiAdbS8/mPGAceDuO/2b7rn1FbD42wEnkKa7Zf0+hUKQcANvItSk7gPg
 CdNQ==
X-Gm-Message-State: APjAAAWp8xDbdBjsNKmWzkoTgRJCQYd17f6MtEDme/3+eHgBdKNk3GGU
 +kOzXkgIDJt9GkxkyW5MMiI=
X-Google-Smtp-Source: APXvYqxF2KEpnlzp1ZGlYhEdukogtcp6iY9VtggKXORWptClNObsKFyrDpHq8Cu400hV6effKv/8cg==
X-Received: by 2002:a17:90a:d783:: with SMTP id
 z3mr29386876pju.3.1579026915698; 
 Tue, 14 Jan 2020 10:35:15 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee7:f789:dc53:63ae:7bf2:4773])
 by smtp.gmail.com with ESMTPSA id x21sm18862382pfn.164.2020.01.14.10.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 10:35:15 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, Jason Gunthorpe <jgg@ziepe.ca>,
 madhuparnabhowmik04@gmail.com
Date: Wed, 15 Jan 2020 00:04:58 +0530
Message-Id: <25133367-6544-d0af-ae30-5178909748b1@intel.com>
X-Mailer: git-send-email 2.17.1
Received: by 2002:ac9:32e7:0:0:0:0:0 with SMTP id o36csp5920602occ;
 Tue, 14 Jan 2020 10:24:05 -0800 (PST)
X-Received: by 2002:aa7:9629:: with SMTP id r9mr26920646pfg.51.1579026245234; 
 Tue, 14 Jan 2020 10:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579026245; cv=none;
 d=google.com; s=arc-20160816;
 b=sUoWIQN+tAJuxYoWFniwybaPmwHKxKQwKXH0gCf31IdC+kNLNdC5kFLajHJTyQkLyD
 sIVfUeZuL1CztNcL6o/ZfS5XS+vYIeTJr4/0gCEo6s89uqLvbB1jEfnEBpoeZ1/DT+8m
 wmTCB3rimQtvcUo+B4t/sBc9YA5TJjnNzsxhqAf+yKag8JdtDNOS+wMT5+ZBYxF7UfI6
 m756z85lWH6IWj/0+G0ocqOxlrMbAMRDWOeKXskAqp5BgQ4+8ZBOSZvEe7gdiakB78JN
 6DnKBCytuRGYWXnj5wHzdCnEYCzt7VN8pfPGlnexbqJ6CB5sl4iT23wKLD7LLOtUM1A+
 nmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:references:cc:to:from:subject;
 bh=9HTqHNE8Y8erjs1/OJln17OqFLAniByxvJG/6jsITqI=;
 b=J0dtBdSxCe2SjNiCCqOfXJn6QXRb8V22VFoxFYk7s1NJ8MPDwNB4p+X36CfV4nQ9hd
 MFo0qrrdQAeDW5697/tqSE0p3G1b7wns5fwjthEyh3s9c1m5/lpa+X5Z2Snmr/R0zDw0
 DV8MlbjlywF2Dz/e9v0RnWGRbm/NTBfaDVsLUHKavOtRrSO5DnAg+w57NdwQHbzYiBcl
 75JCKaRCb/TDJlCetr3MhqFyCcMWuIPloLZIH7WYvv41XvBQeoWNjCsyIE9frkPnMDE2
 KwzWtdTFL2AxAwuFNAGsPvGT9CMgQGB1iaV8WhL8wdcbxaWb3qzM4Drd8mgd6NCU798j
 iT1g==
ARC-Authentication-Results: i=1; mx.google.com;
 spf=pass (google.com: domain of dennis.dalessandro@intel.com designates
 192.55.52.151 as permitted sender) smtp.mailfrom=dennis.dalessandro@intel.com;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com. [192.55.52.151])
 by mx.google.com with ESMTPS id k10si14978517pgi.505.2020.01.14.10.24.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 10:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of dennis.dalessandro@intel.com
 designates 192.55.52.151 as permitted sender) client-ip=192.55.52.151; 
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 10:24:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,319,1574150400"; 
 d="scan'208";a="213424198"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.179])
 ([10.254.201.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Jan 2020 10:24:02 -0800
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
Content-Language: en-US
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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
Message-ID: <20200114183458.i3u-I4saoSJzxzYptVB6fGxnHvkp60A65SD9o9bG4S0@z>

RnJvbTogRGVubmlzIERhbGVzc2FuZHJvIDxkZW5uaXMuZGFsZXNzYW5kcm9AaW50ZWwuY29tPgoK
T24gMS8xNC8yMDIwIDEyOjAwIFBNLCBEZW5uaXMgRGFsZXNzYW5kcm8gd3JvdGU6Cj4gT24gMS8x
NC8yMDIwIDExOjU3IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+IE9uIFR1ZSwgSmFuIDE0
LCAyMDIwIGF0IDA5OjUzOjQ1UE0gKzA1MzAsIAo+PiBtYWRodXBhcm5hYmhvd21pazA0QGdtYWls
LmNvbSB3cm90ZToKPj4+IEZyb206IE1hZGh1cGFybmEgQmhvd21payA8bWFkaHVwYXJuYWJob3dt
aWswNEBnbWFpbC5jb20+Cj4+Pgo+Pj4gbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UgaGFzIGJ1aWx0
LWluIFJDVSBhbmQgbG9jayBjaGVja2luZy4KPj4+IFBhc3MgY29uZCBhcmd1bWVudCB0byBsaXN0
X2Zvcl9lYWNoX2VudHJ5X3JjdS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJo
b3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgo+Pj4gwqAgZHJpdmVycy9pbmZp
bmliYW5kL2h3L2hmaTEvdmVyYnMuYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lu
ZmluaWJhbmQvaHcvaGZpMS92ZXJicy5jIAo+Pj4gYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvaGZp
MS92ZXJicy5jCj4+PiBpbmRleCAwODllMjAxZDc1NTAuLjIyZjJkNGZkMjU3NyAxMDA2NDQKPj4+
ICsrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3ZlcmJzLmMKPj4+IEBAIC01MTUsNyAr
NTE1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGhmaTFfaGFuZGxlX3BhY2tldChzdHJ1Y3QgCj4+
PiBoZmkxX3BhY2tldCAqcGFja2V0LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9wYV9nZXRfbGlkKHBhY2tldC0+ZGxpZCwgOUIpKTsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoIW1jYXN0KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBkcm9wOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1
KHAsICZtY2FzdC0+cXBfbGlzdCwgbGlzdCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGxpc3RfZm9y
X2VhY2hfZW50cnlfcmN1KHAsICZtY2FzdC0+cXBfbGlzdCwgbGlzdCwgCj4+PiBsb2NrZGVwX2lz
X2hlbGQoJihpYnAtPnJ2cC5sb2NrKSkpIHsKPj4KPj4gT2theSwgdGhpcyBsb29rcyByZWFzb25h
YmxlCj4+Cj4+IE1pa2UsIERlbm5pcywgaXMgdGhpcyB0aGUgcmlnaHQgbG9jayB0byB0ZXN0Pwo+
Pgo+IAo+IEknbSBsb29raW5nIGF0IHRoYXQgcmlnaHQgbm93IGFjdHVhbGx5LCBJIGRvbid0IHRo
aW5rIHRoaXMgaXMgY29ycmVjdC4gCj4gV2FudGVkIHRvIHRhbGsgdG8gTWlrZSBiZWZvcmUgSSBz
ZW5kIGEgcmVzcG9uc2UgdGhvdWdoLgo+IAo+IC1EZW5ueQoKVGhhdCdzIGRlZmluaXRlbHkgZ29p
bmcgdG8gdGhyb3cgYSB0b24gb2YgbG9jayBkZXAgbWVzc2FnZXMuIEl0J3Mgbm90IApyZWFsbHkg
dGhlIHJpZ2h0IGxvY2sgZWl0aGVyLiBJbnN0ZWFkIHdoYXQgd2UgcHJvYmFibHkgbmVlZCB0byBk
byBpcyAKd2hhdCB3ZSBkbyBpbiB0aGUgbm9uLW11bHRpY2FzdCBwYXJ0IG9mIHRoZSBjb2RlIGFu
ZCB0YWtlIHRoZSAKcmN1X3JlYWRfbG9jaygpLgoKSSdkIHNheSBob2xkIG9mZiBvbiB0aGlzIGFu
ZCB3ZSdsbCBmaXggaXQgcmlnaHQuIFNhbWUgZ29lcyBmb3IgdGhlIHFpYiBvbmUuCgpBbHJpZ2h0
LCB0aGFuayB5b3UgZm9yIHJldmlld2luZy4KClRoZSByZG1hdnQgb25lIHRob3VnaCBsb29rcyB0
byBiZSBPSy4gSSdsbCBnaXZlIGl0IGEgdGVzdC4KClRoYW5rIHlvdSwKTWFkaHVwYXJuYQoKLURl
bm55Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
