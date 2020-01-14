Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958D8C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:47:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6996424655
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6996424655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4424A20116;
	Tue, 14 Jan 2020 19:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKzgMgjmSnFA; Tue, 14 Jan 2020 19:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DED4204E4;
	Tue, 14 Jan 2020 19:47:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D8D5C18DD;
	Tue, 14 Jan 2020 19:47:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72F16C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F92F86092
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ju37Miq4TPZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:46:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1A9158606C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:46:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 11:46:54 -0800
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="213448748"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.179])
 ([10.254.201.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Jan 2020 11:46:52 -0800
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
 <20200114194148.GD22037@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <7959316e-7647-9ba3-5f1a-10c8d31a2994@intel.com>
Date: Tue, 14 Jan 2020 14:46:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200114194148.GD22037@ziepe.ca>
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

T24gMS8xNC8yMDIwIDI6NDEgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUdWUsIEph
biAxNCwgMjAyMCBhdCAwMToyNDowMFBNIC0wNTAwLCBEZW5uaXMgRGFsZXNzYW5kcm8gd3JvdGU6
Cj4+IE9uIDEvMTQvMjAyMCAxMjowMCBQTSwgRGVubmlzIERhbGVzc2FuZHJvIHdyb3RlOgo+Pj4g
T24gMS8xNC8yMDIwIDExOjU3IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+Pj4gT24gVHVl
LCBKYW4gMTQsIDIwMjAgYXQgMDk6NTM6NDVQTSArMDUzMCwKPj4+PiBtYWRodXBhcm5hYmhvd21p
azA0QGdtYWlsLmNvbSB3cm90ZToKPj4+Pj4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRo
dXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4KPj4+Pj4KPj4+Pj4gbGlzdF9mb3JfZWFjaF9lbnRy
eV9yY3UgaGFzIGJ1aWx0LWluIFJDVSBhbmQgbG9jayBjaGVja2luZy4KPj4+Pj4gUGFzcyBjb25k
IGFyZ3VtZW50IHRvIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29t
Pgo+Pj4+PiAgwqAgZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdmVyYnMuYyB8IDIgKy0KPj4+
Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdmVyYnMuYwo+
Pj4+PiBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3ZlcmJzLmMKPj4+Pj4gaW5kZXggMDg5
ZTIwMWQ3NTUwLi4yMmYyZDRmZDI1NzcgMTAwNjQ0Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvaW5maW5p
YmFuZC9ody9oZmkxL3ZlcmJzLmMKPj4+Pj4gQEAgLTUxNSw3ICs1MTUsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgaGZpMV9oYW5kbGVfcGFja2V0KHN0cnVjdAo+Pj4+PiBoZmkxX3BhY2tldCAqcGFj
a2V0LAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG9wYV9nZXRfbGlkKHBhY2tldC0+ZGxpZCwgOUIpKTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIW1jYXN0KQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBk
cm9wOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UocCwgJm1j
YXN0LT5xcF9saXN0LCBsaXN0KSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNo
X2VudHJ5X3JjdShwLCAmbWNhc3QtPnFwX2xpc3QsIGxpc3QsCj4+Pj4+IGxvY2tkZXBfaXNfaGVs
ZCgmKGlicC0+cnZwLmxvY2spKSkgewo+Pj4+Cj4+Pj4gT2theSwgdGhpcyBsb29rcyByZWFzb25h
YmxlCj4+Pj4KPj4+PiBNaWtlLCBEZW5uaXMsIGlzIHRoaXMgdGhlIHJpZ2h0IGxvY2sgdG8gdGVz
dD8KPj4+Pgo+Pj4KPj4+IEknbSBsb29raW5nIGF0IHRoYXQgcmlnaHQgbm93IGFjdHVhbGx5LCBJ
IGRvbid0IHRoaW5rIHRoaXMgaXMgY29ycmVjdC4KPj4+IFdhbnRlZCB0byB0YWxrIHRvIE1pa2Ug
YmVmb3JlIEkgc2VuZCBhIHJlc3BvbnNlIHRob3VnaC4KPj4+Cj4+PiAtRGVubnkKPj4KPj4gVGhh
dCdzIGRlZmluaXRlbHkgZ29pbmcgdG8gdGhyb3cgYSB0b24gb2YgbG9jayBkZXAgbWVzc2FnZXMu
IEl0J3Mgbm90IHJlYWxseQo+PiB0aGUgcmlnaHQgbG9jayBlaXRoZXIuIEluc3RlYWQgd2hhdCB3
ZSBwcm9iYWJseSBuZWVkIHRvIGRvIGlzIHdoYXQgd2UgZG8gaW4KPj4gdGhlIG5vbi1tdWx0aWNh
c3QgcGFydCBvZiB0aGUgY29kZSBhbmQgdGFrZSB0aGUgcmN1X3JlYWRfbG9jaygpLgo+IAo+IFVo
Li4gd2h5IGlzIHRoaXMgdXNpbmcgdGhlIF9yY3UgdmFyaWVudCB3aXRob3V0IGhvbGRpbmcgdGhl
IHJjdSBsb2NrPwo+IFRoYXQgaXMgcXVpdGUgd3JvbmcgYWxyZWFkeS4KPgoKWWVwLCBzZWVtcyBs
aWtlIGEgYnVnIHRvIG1lLiBQYXRjaCBmb3J0aGNvbWluZy4KCi1EZW5ueQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMg
bWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgta2VybmVsLW1lbnRlZXMK
