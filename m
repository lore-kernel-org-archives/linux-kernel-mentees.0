Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06067C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 01:36:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C646F20729
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 01:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C646F20729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9033188383;
	Tue, 21 Jul 2020 01:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iput+zluItWR; Tue, 21 Jul 2020 01:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 698D4881B7;
	Tue, 21 Jul 2020 01:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55862C089F;
	Tue, 21 Jul 2020 01:36:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2578BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 01:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC90E20512
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 01:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBWs0dmqmMpR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 01:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by silver.osuosl.org (Postfix) with ESMTPS id B739D2047D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 01:36:31 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 26509A670D8F65776AE7;
 Tue, 21 Jul 2020 09:36:27 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 21 Jul 2020
 09:36:18 +0800
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>, Adam Radford
 <aradford@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Adaptec OEM Raid Solutions
 <aacraid@microsemi.com>, Hannes Reinecke <hare@suse.com>, Bradley Grove
 <linuxdrivers@attotech.com>, John Garry <john.garry@huawei.com>, Don Brace
 <don.brace@microsemi.com>, James Smart <james.smart@broadcom.com>, "Dick
 Kennedy" <dick.kennedy@broadcom.com>, Kashyap Desai
 <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, Sathya Prakash
 <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Jack Wang
 <jinpu.wang@cloud.ionos.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-8-vaibhavgupta40@gmail.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <ca184858-f35d-3cc2-983c-3fab71c04264@hisilicon.com>
Date: Tue, 21 Jul 2020 09:36:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200720133427.454400-8-vaibhavgupta40@gmail.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 07/15] scsi: hisi_sas_v3_hw:
 use generic power management
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CgrU2iAyMDIwLzcvMjAgMjE6MzQsIFZhaWJoYXYgR3VwdGEg0LS1wDoKPiBXaXRoIGxlZ2FjeSBQ
TSwgZHJpdmVycyB0aGVtc2VsdmVzIHdlcmUgcmVzcG9uc2libGUgZm9yIG1hbmFnaW5nIHRoZQo+
IGRldmljZSdzIHBvd2VyIHN0YXRlcyBhbmQgdGFrZXMgY2FyZSBvZiByZWdpc3RlciBzdGF0ZXMu
Cj4KPiBBZnRlciB1cGdyYWRpbmcgdG8gdGhlIGdlbmVyaWMgc3RydWN0dXJlLCBQQ0kgY29yZSB3
aWxsIHRha2UgY2FyZSBvZgo+IHJlcXVpcmVkIHRhc2tzIGFuZCBkcml2ZXJzIHNob3VsZCBkbyBv
bmx5IGRldmljZS1zcGVjaWZpYyBvcGVyYXRpb25zLgo+Cj4gVGhlIGRyaXZlciB3YXMgY2FsbGlu
ZyBwY2lfc2F2ZS9yZXN0b3JlX3N0YXRlKCksIHBjaV9jaG9vc2Vfc3RhdGUoKSwKPiBwY2lfZW5h
YmxlL2Rpc2FibGVfZGV2aWNlKCkgYW5kIHBjaV9zZXRfcG93ZXJfc3RhdGUoKSB3aGljaCBpcyBu
byBtb3JlCj4gbmVlZGVkLgo+Cj4gQ29tcGlsZS10ZXN0ZWQgb25seS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFZhaWJoYXYgR3VwdGEgPHZhaWJoYXZndXB0YTQwQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5
OiBYaWFuZyBDaGVuIDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPgoKPiAtLS0KPiAgIGRyaXZl
cnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192M19ody5jIHwgMzIgKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvaGlzaV9zYXMvaGlzaV9zYXNfdjNf
aHcuYyBiL2RyaXZlcnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192M19ody5jCj4gaW5kZXggNTVl
MjMyMWE2NWJjLi44MjRiZmJlMWFiYmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zY3NpL2hpc2lf
c2FzL2hpc2lfc2FzX3YzX2h3LmMKPiArKysgYi9kcml2ZXJzL3Njc2kvaGlzaV9zYXMvaGlzaV9z
YXNfdjNfaHcuYwo+IEBAIC0zMzc0LDEzICszMzc0LDEzIEBAIGVudW0gewo+ICAgCWhpcDA4LAo+
ICAgfTsKPiAgIAo+IC1zdGF0aWMgaW50IGhpc2lfc2FzX3YzX3N1c3BlbmQoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIHBtX21lc3NhZ2VfdCBzdGF0ZSkKPiArc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBoaXNpX3Nhc192M19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldl9kKQo+ICAgewo+ICsJc3Ry
dWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldl9kKTsKPiAgIAlzdHJ1Y3Qgc2FzX2hh
X3N0cnVjdCAqc2hhID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAgCXN0cnVjdCBoaXNpX2hi
YSAqaGlzaV9oYmEgPSBzaGEtPmxsZGRfaGE7Cj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0gaGlz
aV9oYmEtPmRldjsKPiAgIAlzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCA9IGhpc2lfaGJhLT5zaG9z
dDsKPiAtCXBjaV9wb3dlcl90IGRldmljZV9zdGF0ZTsKPiAgIAlpbnQgcmM7Cj4gICAKPiAgIAlp
ZiAoIXBkZXYtPnBtX2NhcCkgewo+IEBAIC0zNDA2LDEyICszNDA2LDcgQEAgc3RhdGljIGludCBo
aXNpX3Nhc192M19zdXNwZW5kKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBwbV9tZXNzYWdlX3Qgc3Rh
dGUpCj4gICAKPiAgIAloaXNpX3Nhc19pbml0X21lbShoaXNpX2hiYSk7Cj4gICAKPiAtCWRldmlj
ZV9zdGF0ZSA9IHBjaV9jaG9vc2Vfc3RhdGUocGRldiwgc3RhdGUpOwo+IC0JZGV2X3dhcm4oZGV2
LCAiZW50ZXJpbmcgb3BlcmF0aW5nIHN0YXRlIFtEJWRdXG4iLAo+IC0JCQlkZXZpY2Vfc3RhdGUp
Owo+IC0JcGNpX3NhdmVfc3RhdGUocGRldik7Cj4gLQlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7
Cj4gLQlwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIGRldmljZV9zdGF0ZSk7Cj4gKwlkZXZfd2Fy
bihkZXYsICJlbnRlcmluZyBzdXNwZW5kIHN0YXRlXG4iKTsKPiAgIAo+ICAgCWhpc2lfc2FzX3Jl
bGVhc2VfdGFza3MoaGlzaV9oYmEpOwo+ICAgCj4gQEAgLTM0MTksOCArMzQxNCw5IEBAIHN0YXRp
YyBpbnQgaGlzaV9zYXNfdjNfc3VzcGVuZChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgcG1fbWVzc2Fn
ZV90IHN0YXRlKQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgaGlzaV9z
YXNfdjNfcmVzdW1lKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICtzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIGhpc2lfc2FzX3YzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXZfZCkKPiAgIHsKPiAr
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXZfZCk7Cj4gICAJc3RydWN0IHNh
c19oYV9zdHJ1Y3QgKnNoYSA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgIAlzdHJ1Y3QgaGlz
aV9oYmEgKmhpc2lfaGJhID0gc2hhLT5sbGRkX2hhOwo+ICAgCXN0cnVjdCBTY3NpX0hvc3QgKnNo
b3N0ID0gaGlzaV9oYmEtPnNob3N0Owo+IEBAIC0zNDMwLDE2ICszNDI2LDggQEAgc3RhdGljIGlu
dCBoaXNpX3Nhc192M19yZXN1bWUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICAKPiAgIAlkZXZf
d2FybihkZXYsICJyZXN1bWluZyBmcm9tIG9wZXJhdGluZyBzdGF0ZSBbRCVkXVxuIiwKPiAgIAkJ
IGRldmljZV9zdGF0ZSk7Cj4gLQlwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9EMCk7Cj4g
LQlwY2lfZW5hYmxlX3dha2UocGRldiwgUENJX0QwLCAwKTsKPiAtCXBjaV9yZXN0b3JlX3N0YXRl
KHBkZXYpOwo+IC0JcmMgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiAtCWlmIChyYykgewo+
IC0JCWRldl9lcnIoZGV2LCAiZW5hYmxlIGRldmljZSBmYWlsZWQgZHVyaW5nIHJlc3VtZSAoJWQp
XG4iLCByYyk7Cj4gLQkJcmV0dXJuIHJjOwo+IC0JfQo+ICsJZGV2aWNlX3dha2V1cF9kaXNhYmxl
KGRldl9kKTsKPiAgIAo+IC0JcGNpX3NldF9tYXN0ZXIocGRldik7Cj4gICAJc2NzaV91bmJsb2Nr
X3JlcXVlc3RzKHNob3N0KTsKPiAgIAljbGVhcl9iaXQoSElTSV9TQVNfUkVKRUNUX0NNRF9CSVQs
ICZoaXNpX2hiYS0+ZmxhZ3MpOwo+ICAgCj4gQEAgLTM0NDcsNyArMzQzNSw2IEBAIHN0YXRpYyBp
bnQgaGlzaV9zYXNfdjNfcmVzdW1lKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICAgCXJjID0gaHdf
aW5pdF92M19odyhoaXNpX2hiYSk7Cj4gICAJaWYgKHJjKSB7Cj4gICAJCXNjc2lfcmVtb3ZlX2hv
c3Qoc2hvc3QpOwo+IC0JCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiAgIAkJcmV0dXJuIHJj
Owo+ICAgCX0KPiAgIAloaXNpX2hiYS0+aHctPnBoeXNfaW5pdChoaXNpX2hiYSk7Cj4gQEAgLTM0
NjgsMTMgKzM0NTUsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXJyb3JfaGFuZGxlcnMg
aGlzaV9zYXNfZXJyX2hhbmRsZXIgPSB7Cj4gICAJLnJlc2V0X2RvbmUJPSBoaXNpX3Nhc19yZXNl
dF9kb25lX3YzX2h3LAo+ICAgfTsKPiAgIAo+ICtzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoaGlz
aV9zYXNfdjNfcG1fb3BzLAo+ICsJCQkgaGlzaV9zYXNfdjNfc3VzcGVuZCwKPiArCQkJIGhpc2lf
c2FzX3YzX3Jlc3VtZSk7Cj4gKwo+ICAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHNhc192M19w
Y2lfZHJpdmVyID0gewo+ICAgCS5uYW1lCQk9IERSVl9OQU1FLAo+ICAgCS5pZF90YWJsZQk9IHNh
c192M19wY2lfdGFibGUsCj4gICAJLnByb2JlCQk9IGhpc2lfc2FzX3YzX3Byb2JlLAo+ICAgCS5y
ZW1vdmUJCT0gaGlzaV9zYXNfdjNfcmVtb3ZlLAo+IC0JLnN1c3BlbmQJPSBoaXNpX3Nhc192M19z
dXNwZW5kLAo+IC0JLnJlc3VtZQkJPSBoaXNpX3Nhc192M19yZXN1bWUsCj4gKwkuZHJpdmVyLnBt
CT0gJmhpc2lfc2FzX3YzX3BtX29wcywKPiAgIAkuZXJyX2hhbmRsZXIJPSAmaGlzaV9zYXNfZXJy
X2hhbmRsZXIsCj4gICB9Owo+ICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
