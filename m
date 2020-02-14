Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683D1C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:25:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8982168B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C8982168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12B94868C4;
	Fri, 14 Feb 2020 17:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNgrG6ac5fjS; Fri, 14 Feb 2020 17:25:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B468868BD;
	Fri, 14 Feb 2020 17:25:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73091C0881;
	Fri, 14 Feb 2020 17:25:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40599C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39B8C8820A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geFtkNQmbQBH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:24:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D61C8820C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:24:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 09:24:57 -0800
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="223081205"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.204.146])
 ([10.254.204.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Feb 2020 09:24:54 -0800
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
 <CAF65HP0RsW5FMRRf5Lia2=MTKex-KwO7-_NsCUef94YKBg+pfA@mail.gmail.com>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <c773894a-b011-2419-683a-3b851583fc73@intel.com>
Date: Fri, 14 Feb 2020 12:24:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAF65HP0RsW5FMRRf5Lia2=MTKex-KwO7-_NsCUef94YKBg+pfA@mail.gmail.com>
Content-Language: en-US
Cc: mike.marciniszyn@intel.com, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
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

T24gMi8xNC8yMDIwIDEwOjQzIEFNLCBNYWRodXBhcm5hIEJob3dtaWsgd3JvdGU6Cj4gCj4gCj4g
T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMTI6MDUgQU0gPG1hZGh1cGFybmFiaG93bWlrMDRAZ21h
aWwuY29tIAo+IDxtYWlsdG86bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20+PiB3cm90ZToK
PiAKPiAgICAgRnJvbTogRGVubmlzIERhbGVzc2FuZHJvIDxkZW5uaXMuZGFsZXNzYW5kcm9AaW50
ZWwuY29tCj4gICAgIDxtYWlsdG86ZGVubmlzLmRhbGVzc2FuZHJvQGludGVsLmNvbT4+Cj4gCj4g
ICAgIE9uIDEvMTQvMjAyMCAxMjowMCBQTSwgRGVubmlzIERhbGVzc2FuZHJvIHdyb3RlOgo+ICAg
ICAgPiBPbiAxLzE0LzIwMjAgMTE6NTcgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiAgICAg
ID4+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA5OjUzOjQ1UE0gKzA1MzAsCj4gICAgICA+PiBt
YWRodXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbQo+ICAgICA8bWFpbHRvOm1hZGh1cGFybmFiaG93
bWlrMDRAZ21haWwuY29tPiB3cm90ZToKPiAgICAgID4+PiBGcm9tOiBNYWRodXBhcm5hIEJob3dt
aWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tCj4gICAgIDxtYWlsdG86bWFkaHVwYXJu
YWJob3dtaWswNEBnbWFpbC5jb20+Pgo+ICAgICAgPj4+Cj4gICAgICA+Pj4gbGlzdF9mb3JfZWFj
aF9lbnRyeV9yY3UgaGFzIGJ1aWx0LWluIFJDVSBhbmQgbG9jayBjaGVja2luZy4KPiAgICAgID4+
PiBQYXNzIGNvbmQgYXJndW1lbnQgdG8gbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UuCj4gICAgICA+
Pj4KPiAgICAgID4+PiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJob3dtaWsKPiAgICAgPG1h
ZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tIDxtYWlsdG86bWFkaHVwYXJuYWJob3dtaWswNEBn
bWFpbC5jb20+Pgo+ICAgICAgPj4+IMKgIGRyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3ZlcmJz
LmMgfCAyICstCj4gICAgICA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gICAgICA+Pj4KPiAgICAgID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bmZpbmliYW5kL2h3L2hmaTEvdmVyYnMuYwo+ICAgICAgPj4+IGIvZHJpdmVycy9pbmZpbmliYW5k
L2h3L2hmaTEvdmVyYnMuYwo+ICAgICAgPj4+IGluZGV4IDA4OWUyMDFkNzU1MC4uMjJmMmQ0ZmQy
NTc3IDEwMDY0NAo+ICAgICAgPj4+ICsrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3Zl
cmJzLmMKPiAgICAgID4+PiBAQCAtNTE1LDcgKzUxNSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBo
ZmkxX2hhbmRsZV9wYWNrZXQoc3RydWN0Cj4gICAgICA+Pj4gaGZpMV9wYWNrZXQgKnBhY2tldCwK
PiAgICAgID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgb3BhX2dldF9saWQocGFja2V0LT5kbGlkLCA5QikpOwo+ICAgICAgPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIW1jYXN0KQo+ICAgICAgPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gZHJvcDsKPiAgICAgID4+PiAtwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRy
eV9yY3UocCwgJm1jYXN0LT5xcF9saXN0LCBsaXN0KSB7Cj4gICAgICA+Pj4gK8KgwqDCoMKgwqDC
oMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHAsICZtY2FzdC0+cXBfbGlzdCwgbGlzdCwKPiAg
ICAgID4+PiBsb2NrZGVwX2lzX2hlbGQoJihpYnAtPnJ2cC5sb2NrKSkpIHsKPiAgICAgID4+Cj4g
ICAgICA+PiBPa2F5LCB0aGlzIGxvb2tzIHJlYXNvbmFibGUKPiAgICAgID4+Cj4gICAgICA+PiBN
aWtlLCBEZW5uaXMsIGlzIHRoaXMgdGhlIHJpZ2h0IGxvY2sgdG8gdGVzdD8KPiAgICAgID4+Cj4g
ICAgICA+Cj4gICAgICA+IEknbSBsb29raW5nIGF0IHRoYXQgcmlnaHQgbm93IGFjdHVhbGx5LCBJ
IGRvbid0IHRoaW5rIHRoaXMgaXMKPiAgICAgY29ycmVjdC4KPiAgICAgID4gV2FudGVkIHRvIHRh
bGsgdG8gTWlrZSBiZWZvcmUgSSBzZW5kIGEgcmVzcG9uc2UgdGhvdWdoLgo+ICAgICAgPgo+ICAg
ICAgPiAtRGVubnkKPiAKPiAgICAgVGhhdCdzIGRlZmluaXRlbHkgZ29pbmcgdG8gdGhyb3cgYSB0
b24gb2YgbG9jayBkZXAgbWVzc2FnZXMuIEl0J3Mgbm90Cj4gICAgIHJlYWxseSB0aGUgcmlnaHQg
bG9jayBlaXRoZXIuIEluc3RlYWQgd2hhdCB3ZSBwcm9iYWJseSBuZWVkIHRvIGRvIGlzCj4gICAg
IHdoYXQgd2UgZG8gaW4gdGhlIG5vbi1tdWx0aWNhc3QgcGFydCBvZiB0aGUgY29kZSBhbmQgdGFr
ZSB0aGUKPiAgICAgcmN1X3JlYWRfbG9jaygpLgo+IAo+ICAgICBJJ2Qgc2F5IGhvbGQgb2ZmIG9u
IHRoaXMgYW5kIHdlJ2xsIGZpeCBpdCByaWdodC4gU2FtZSBnb2VzIGZvciB0aGUKPiAgICAgcWli
IG9uZS4KPiAKPiAgICAgQWxyaWdodCwgdGhhbmsgeW91IGZvciByZXZpZXdpbmcuCj4gCj4gICAg
IFRoZSByZG1hdnQgb25lIHRob3VnaCBsb29rcyB0byBiZSBPSy4gSSdsbCBnaXZlIGl0IGEgdGVz
dC4KPiAKPiBIaSwKPiBJIGp1c3Qgd2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzLgo+IEFueSB1
cGRhdGVzPwo+IEFsc28sIGlzIHRoZSBidWcgZml4ZWQgbm93Pwo+IAo+IFRoYW5rIHlvdSwKPiBN
YWRodXBhcm5hCj4gCj4gICAgIFRoYW5rIHlvdSwKPiAgICAgTWFkaHVwYXJuYQo+IAo+ICAgICAt
RGVubnkKPiAKCkkndmUgZ290IGEgcGF0Y2ggZ29pbmcgdGhyb3VnaCBpbnRlcm5hbCBkaXNjdXNz
aW9uIGFuZCB0ZXN0aW5nIGZvciAKYWRkaW5nIHJjdSByZWFkIGxvY2tpbmcuCgpUaGUgUkRNQVZU
IHBhdGNoLCBJIHdhcyBPSyB3aXRoIGdvaW5nIGluLCBJIGd1ZXNzIEkganVzdCBtZW50aW9uZWQg
dGhhdCAKaW4gYSByZXBseSByYXRoZXIgdGhhbiBhZGRpbmcgYW4gUkIgdGFnLiBMZXQgbWUgZ28g
YWhlYWQgYW5kIGRvIHRoYXQuCgotRGVubnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4
LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
