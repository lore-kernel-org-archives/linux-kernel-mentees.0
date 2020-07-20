Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D622C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 06:17:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C35B2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 06:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C35B2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 05860204A1;
	Mon, 20 Jul 2020 06:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDMbskN6-shK; Mon, 20 Jul 2020 06:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AADE120445;
	Mon, 20 Jul 2020 06:17:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86B6AC0894;
	Mon, 20 Jul 2020 06:17:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6616FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4DCAA86BC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x+ygq3iF1OOD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7515586BDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:16:58 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F053821341B1D8D5B252;
 Mon, 20 Jul 2020 14:16:53 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 14:16:45 +0800
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Adam Radford <aradford@gmail.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Adaptec OEM Raid Solutions
 <aacraid@microsemi.com>, Hannes Reinecke <hare@suse.com>, Bradley Grove
 <linuxdrivers@attotech.com>, John Garry <john.garry@huawei.com>, Don Brace
 <don.brace@microsemi.com>, James Smart <james.smart@broadcom.com>, "Dick
 Kennedy" <dick.kennedy@broadcom.com>, Kashyap Desai
 <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, Sathya Prakash
 <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Jack Wang
 <jinpu.wang@cloud.ionos.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
 <20200717063438.175022-8-vaibhavgupta40@gmail.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <367bd5d3-f0a6-2bd7-2945-3095c827dbe6@hisilicon.com>
Date: Mon, 20 Jul 2020 14:16:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200717063438.175022-8-vaibhavgupta40@gmail.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v1 07/15] scsi: hisi_sas_v3_hw:
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

SGkgVmFpYmhhdiwKCtTaIDIwMjAvNy8xNyAxNDozNCwgVmFpYmhhdiBHdXB0YSDQtLXAOgo+IFdp
dGggbGVnYWN5IFBNLCBkcml2ZXJzIHRoZW1zZWx2ZXMgd2VyZSByZXNwb25zaWJsZSBmb3IgbWFu
YWdpbmcgdGhlCj4gZGV2aWNlJ3MgcG93ZXIgc3RhdGVzIGFuZCB0YWtlcyBjYXJlIG9mIHJlZ2lz
dGVyIHN0YXRlcy4KPgo+IEFmdGVyIHVwZ3JhZGluZyB0byB0aGUgZ2VuZXJpYyBzdHJ1Y3R1cmUs
IFBDSSBjb3JlIHdpbGwgdGFrZSBjYXJlIG9mCj4gcmVxdWlyZWQgdGFza3MgYW5kIGRyaXZlcnMg
c2hvdWxkIGRvIG9ubHkgZGV2aWNlLXNwZWNpZmljIG9wZXJhdGlvbnMuCj4KPiBUaGUgZHJpdmVy
IHdhcyBjYWxsaW5nIHBjaV9zYXZlL3Jlc3RvcmVfc3RhdGUoKSwgcGNpX2Nob29zZV9zdGF0ZSgp
LAo+IHBjaV9lbmFibGUvZGlzYWJsZV9kZXZpY2UoKSBhbmQgcGNpX3NldF9wb3dlcl9zdGF0ZSgp
IHdoaWNoIGlzIG5vIG1vcmUKPiBuZWVkZWQuCj4KPiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogVmFpYmhhdiBHdXB0YSA8dmFpYmhhdmd1cHRhNDBAZ21haWwuY29tPgoK
UmV2aWV3ZWQtYnk6IFhpYW5nIENoZW4gPGNoZW54aWFuZzY2QGhpc2lsaWNvbi5jb20+Ckp1c3Qg
YSBzbWFsbCBjb21tZW50LCBiZWxvdy4KCj4gLS0tCj4gICBkcml2ZXJzL3Njc2kvaGlzaV9zYXMv
aGlzaV9zYXNfdjNfaHcuYyB8IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zY3NpL2hpc2lfc2FzL2hpc2lfc2FzX3YzX2h3LmMgYi9kcml2ZXJzL3Nj
c2kvaGlzaV9zYXMvaGlzaV9zYXNfdjNfaHcuYwo+IGluZGV4IDU1ZTIzMjFhNjViYy4uNDU2MDVh
NTIwYmM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192M19o
dy5jCj4gKysrIGIvZHJpdmVycy9zY3NpL2hpc2lfc2FzL2hpc2lfc2FzX3YzX2h3LmMKPiBAQCAt
MzM3NCwxMyArMzM3NCwxMyBAQCBlbnVtIHsKPiAgIAloaXAwOCwKPiAgIH07Cj4gICAKPiAtc3Rh
dGljIGludCBoaXNpX3Nhc192M19zdXNwZW5kKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBwbV9tZXNz
YWdlX3Qgc3RhdGUpCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaGlzaV9zYXNfdjNfc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXZfZCkKPiAgIHsKPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2RldihkZXZfZCk7Cj4gICAJc3RydWN0IHNhc19oYV9zdHJ1Y3QgKnNoYSA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgIAlzdHJ1Y3QgaGlzaV9oYmEgKmhpc2lfaGJhID0gc2hh
LT5sbGRkX2hhOwo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IGhpc2lfaGJhLT5kZXY7Cj4gICAJ
c3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBoaXNpX2hiYS0+c2hvc3Q7Cj4gLQlwY2lfcG93ZXJf
dCBkZXZpY2Vfc3RhdGU7Cj4gICAJaW50IHJjOwo+ICAgCj4gICAJaWYgKCFwZGV2LT5wbV9jYXAp
IHsKPiBAQCAtMzQwNiwyMSArMzQwNiwxNSBAQCBzdGF0aWMgaW50IGhpc2lfc2FzX3YzX3N1c3Bl
bmQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHBtX21lc3NhZ2VfdCBzdGF0ZSkKPiAgIAo+ICAgCWhp
c2lfc2FzX2luaXRfbWVtKGhpc2lfaGJhKTsKPiAgIAo+IC0JZGV2aWNlX3N0YXRlID0gcGNpX2No
b29zZV9zdGF0ZShwZGV2LCBzdGF0ZSk7Cj4gLQlkZXZfd2FybihkZXYsICJlbnRlcmluZyBvcGVy
YXRpbmcgc3RhdGUgW0QlZF1cbiIsCj4gLQkJCWRldmljZV9zdGF0ZSk7CgpQbGVhc2UgcmV0YWlu
IGFib3ZlIHByaW50IHRvIGtlZXAgY29uc2lzdGVuY2Ugd2l0aCB0aGUgcHJpbnQgaW4gZnVuY3Rp
b24gCmhpc2lfc2FzX3YzX3Jlc3VtZSgpLgoKPiAtCXBjaV9zYXZlX3N0YXRlKHBkZXYpOwo+IC0J
cGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+IC0JcGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBk
ZXZpY2Vfc3RhdGUpOwo+IC0KPiAgIAloaXNpX3Nhc19yZWxlYXNlX3Rhc2tzKGhpc2lfaGJhKTsK
PiAgIAo+ICAgCXNhc19zdXNwZW5kX2hhKHNoYSk7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAK
PiAtc3RhdGljIGludCBoaXNpX3Nhc192M19yZXN1bWUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4g
K3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaGlzaV9zYXNfdjNfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldl9kKQo+ICAgewo+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRl
dl9kKTsKPiAgIAlzdHJ1Y3Qgc2FzX2hhX3N0cnVjdCAqc2hhID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAgCXN0cnVjdCBoaXNpX2hiYSAqaGlzaV9oYmEgPSBzaGEtPmxsZGRfaGE7Cj4gICAJ
c3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBoaXNpX2hiYS0+c2hvc3Q7Cj4gQEAgLTM0MzAsMTYg
KzM0MjQsOCBAQCBzdGF0aWMgaW50IGhpc2lfc2FzX3YzX3Jlc3VtZShzdHJ1Y3QgcGNpX2RldiAq
cGRldikKPiAgIAo+ICAgCWRldl93YXJuKGRldiwgInJlc3VtaW5nIGZyb20gb3BlcmF0aW5nIHN0
YXRlIFtEJWRdXG4iLAo+ICAgCQkgZGV2aWNlX3N0YXRlKTsKPiAtCXBjaV9zZXRfcG93ZXJfc3Rh
dGUocGRldiwgUENJX0QwKTsKPiAtCXBjaV9lbmFibGVfd2FrZShwZGV2LCBQQ0lfRDAsIDApOwo+
IC0JcGNpX3Jlc3RvcmVfc3RhdGUocGRldik7Cj4gLQlyYyA9IHBjaV9lbmFibGVfZGV2aWNlKHBk
ZXYpOwo+IC0JaWYgKHJjKSB7Cj4gLQkJZGV2X2VycihkZXYsICJlbmFibGUgZGV2aWNlIGZhaWxl
ZCBkdXJpbmcgcmVzdW1lICglZClcbiIsIHJjKTsKPiAtCQlyZXR1cm4gcmM7Cj4gLQl9Cj4gKwlk
ZXZpY2Vfd2FrZXVwX2Rpc2FibGUoZGV2X2QpOwo+ICAgCj4gLQlwY2lfc2V0X21hc3RlcihwZGV2
KTsKPiAgIAlzY3NpX3VuYmxvY2tfcmVxdWVzdHMoc2hvc3QpOwo+ICAgCWNsZWFyX2JpdChISVNJ
X1NBU19SRUpFQ1RfQ01EX0JJVCwgJmhpc2lfaGJhLT5mbGFncyk7Cj4gICAKPiBAQCAtMzQ0Nyw3
ICszNDMzLDYgQEAgc3RhdGljIGludCBoaXNpX3Nhc192M19yZXN1bWUoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCj4gICAJcmMgPSBod19pbml0X3YzX2h3KGhpc2lfaGJhKTsKPiAgIAlpZiAocmMpIHsK
PiAgIAkJc2NzaV9yZW1vdmVfaG9zdChzaG9zdCk7Cj4gLQkJcGNpX2Rpc2FibGVfZGV2aWNlKHBk
ZXYpOwo+ICAgCQlyZXR1cm4gcmM7Cj4gICAJfQo+ICAgCWhpc2lfaGJhLT5ody0+cGh5c19pbml0
KGhpc2lfaGJhKTsKPiBAQCAtMzQ2OCwxMyArMzQ1MywxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHBjaV9lcnJvcl9oYW5kbGVycyBoaXNpX3Nhc19lcnJfaGFuZGxlciA9IHsKPiAgIAkucmVzZXRf
ZG9uZQk9IGhpc2lfc2FzX3Jlc2V0X2RvbmVfdjNfaHcsCj4gICB9Owo+ICAgCj4gK3N0YXRpYyBT
SU1QTEVfREVWX1BNX09QUyhoaXNpX3Nhc192M19wbV9vcHMsCj4gKwkJCSBoaXNpX3Nhc192M19z
dXNwZW5kLAo+ICsJCQkgaGlzaV9zYXNfdjNfcmVzdW1lKTsKPiArCj4gICBzdGF0aWMgc3RydWN0
IHBjaV9kcml2ZXIgc2FzX3YzX3BjaV9kcml2ZXIgPSB7Cj4gICAJLm5hbWUJCT0gRFJWX05BTUUs
Cj4gICAJLmlkX3RhYmxlCT0gc2FzX3YzX3BjaV90YWJsZSwKPiAgIAkucHJvYmUJCT0gaGlzaV9z
YXNfdjNfcHJvYmUsCj4gICAJLnJlbW92ZQkJPSBoaXNpX3Nhc192M19yZW1vdmUsCj4gLQkuc3Vz
cGVuZAk9IGhpc2lfc2FzX3YzX3N1c3BlbmQsCj4gLQkucmVzdW1lCQk9IGhpc2lfc2FzX3YzX3Jl
c3VtZSwKPiArCS5kcml2ZXIucG0JPSAmaGlzaV9zYXNfdjNfcG1fb3BzLAo+ICAgCS5lcnJfaGFu
ZGxlcgk9ICZoaXNpX3Nhc19lcnJfaGFuZGxlciwKPiAgIH07Cj4gICAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
