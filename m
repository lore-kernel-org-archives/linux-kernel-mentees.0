Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3221C33CB3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 18:24:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908832465A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 18:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908832465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6DDCE20533;
	Tue, 14 Jan 2020 18:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azTorI3EJwZx; Tue, 14 Jan 2020 18:24:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4D1A920006;
	Tue, 14 Jan 2020 18:24:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 370E1C1D83;
	Tue, 14 Jan 2020 18:24:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1101C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E01BF2052E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfwU04XYSaHY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id EBDC320006
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 18:24:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 10:24:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,319,1574150400"; d="scan'208";a="213424198"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.179])
 ([10.254.201.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Jan 2020 10:24:02 -0800
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, madhuparnabhowmik04@gmail.com
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
Message-ID: <25133367-6544-d0af-ae30-5178909748b1@intel.com>
Date: Tue, 14 Jan 2020 13:24:00 -0500
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
ZCB3ZSdsbCBmaXggaXQgcmlnaHQuIFNhbWUgZ29lcyBmb3IgdGhlIHFpYiBvbmUuCgpUaGUgcmRt
YXZ0IG9uZSB0aG91Z2ggbG9va3MgdG8gYmUgT0suIEknbGwgZ2l2ZSBpdCBhIHRlc3QuCgotRGVu
bnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
a2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
