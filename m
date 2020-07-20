Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BBCC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 06:34:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF55E22482
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 06:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVP/VDVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF55E22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A3252049F;
	Mon, 20 Jul 2020 06:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTKoKYAelAeE; Mon, 20 Jul 2020 06:34:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3601720002;
	Mon, 20 Jul 2020 06:34:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3E6BC0894;
	Mon, 20 Jul 2020 06:34:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00F70C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3B568810B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRX+2k1M8bxt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:34:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C55B1880F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:34:17 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n5so9829077pgf.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7GFd7Yku8i+FF1S4CUo1hrbA5Zh0OraFGwFf9HMOIw4=;
 b=mVP/VDVoII2NYltj2o/cI4fLTlW/fCOt78CYJjBWGV3FlC1cg7w1KI0zfcsoirtrHe
 JvbZzVZHR2sXINXqeeAhp+A2yvDPsaqmcWaYJK9TVh1vtyXed+oyhPkBs9lU21w7n0aP
 dwUT3+UKIgLVzg9F7+fC6tFRIys/i902EF85yBj7exUlO6atH0OgZxtlC4nK2ke7/5Bf
 BKDFGs/x2NojAd3JV1QyMpLSgzC6wh/oTwKzRGYGpJqie//kXCGszMeOOJ868KE7zm12
 oRHjiy1/BDf9BqgLxoi1KB9zL7qD3zIBWDnX527KiIslcSBIuVd0Yo25ZcxgP5Tv3iEf
 v3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7GFd7Yku8i+FF1S4CUo1hrbA5Zh0OraFGwFf9HMOIw4=;
 b=frhLZl413BUz+FVTa7/SzJjzIS2XB5g1p0IkEe01Xf1DApmMc16VadzPVtxTdEKsRa
 vcQRFKLYv8L5bHeavv0FAlTLcHSnl81e2ywZ7Za32wLRs8LHEwKFj2g/Tx08Bywgwsvw
 IsY41sR0TprpbO9kDaViOYgJDOUHfMTZQXsd7JbtmlEgfSj1urXF4cOG2C//OQdt0TCH
 yxdcimLjY/Fnfi8U5VUzL+RMuJTYZ2Ub4gG1Bry/0D+CLM7rBwH6ozTvlbqTMg6Ga5cz
 OwBjOxK452jVIHuW8hasTaHXGn8YXqtpvCR+N/E6FVlYJYKavCZGmaz81+w+l8GsrasM
 EhXw==
X-Gm-Message-State: AOAM530nwoyhUtR9Lr6ge+eYXcL+uYgm75dtWEnlZdM9Qef4QW8M4GrH
 5D838bAyVuj9TnJtzT4A8BQ=
X-Google-Smtp-Source: ABdhPJxQmF5oq+pWAT2xYH05CJxxqZ93CWM8ckA5SEl9IkhpdbaKMKvlrTVaOBfMKylYBl9Qs/PVgA==
X-Received: by 2002:aa7:9a03:: with SMTP id w3mr17729156pfj.228.1595226857292; 
 Sun, 19 Jul 2020 23:34:17 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id 195sm7901326pfb.206.2020.07.19.23.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 23:34:16 -0700 (PDT)
Date: Mon, 20 Jul 2020 12:02:53 +0530
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <20200720063253.GA4237@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
 <20200717063438.175022-8-vaibhavgupta40@gmail.com>
 <367bd5d3-f0a6-2bd7-2945-3095c827dbe6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <367bd5d3-f0a6-2bd7-2945-3095c827dbe6@hisilicon.com>
Cc: Don Brace <don.brace@microsemi.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 linux-scsi@vger.kernel.org, Sathya Prakash <sathya.prakash@broadcom.com>,
 esc.storagedev@microsemi.com, James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Adam Radford <aradford@gmail.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 megaraidlinux.pdl@broadcom.com, Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 MPT-FusionLinux.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gTW9uLCBKdWwgMjAsIDIwMjAgYXQgMDI6MTY6NDVQTSArMDgwMCwgY2hlbnhpYW5nIChNKSB3
cm90ZToKPiBIaSBWYWliaGF2LAo+IAo+IOWcqCAyMDIwLzcvMTcgMTQ6MzQsIFZhaWJoYXYgR3Vw
dGEg5YaZ6YGTOgo+ID4gV2l0aCBsZWdhY3kgUE0sIGRyaXZlcnMgdGhlbXNlbHZlcyB3ZXJlIHJl
c3BvbnNpYmxlIGZvciBtYW5hZ2luZyB0aGUKPiA+IGRldmljZSdzIHBvd2VyIHN0YXRlcyBhbmQg
dGFrZXMgY2FyZSBvZiByZWdpc3RlciBzdGF0ZXMuCj4gPiAKPiA+IEFmdGVyIHVwZ3JhZGluZyB0
byB0aGUgZ2VuZXJpYyBzdHJ1Y3R1cmUsIFBDSSBjb3JlIHdpbGwgdGFrZSBjYXJlIG9mCj4gPiBy
ZXF1aXJlZCB0YXNrcyBhbmQgZHJpdmVycyBzaG91bGQgZG8gb25seSBkZXZpY2Utc3BlY2lmaWMg
b3BlcmF0aW9ucy4KPiA+IAo+ID4gVGhlIGRyaXZlciB3YXMgY2FsbGluZyBwY2lfc2F2ZS9yZXN0
b3JlX3N0YXRlKCksIHBjaV9jaG9vc2Vfc3RhdGUoKSwKPiA+IHBjaV9lbmFibGUvZGlzYWJsZV9k
ZXZpY2UoKSBhbmQgcGNpX3NldF9wb3dlcl9zdGF0ZSgpIHdoaWNoIGlzIG5vIG1vcmUKPiA+IG5l
ZWRlZC4KPiA+IAo+ID4gQ29tcGlsZS10ZXN0ZWQgb25seS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogVmFpYmhhdiBHdXB0YSA8dmFpYmhhdmd1cHRhNDBAZ21haWwuY29tPgo+IAo+IFJldmlld2Vk
LWJ5OiBYaWFuZyBDaGVuIDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPgo+IEp1c3QgYSBzbWFs
bCBjb21tZW50LCBiZWxvdy4KPiAKPiA+IC0tLQo+ID4gICBkcml2ZXJzL3Njc2kvaGlzaV9zYXMv
aGlzaV9zYXNfdjNfaHcuYyB8IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192M19ody5jIGIvZHJp
dmVycy9zY3NpL2hpc2lfc2FzL2hpc2lfc2FzX3YzX2h3LmMKPiA+IGluZGV4IDU1ZTIzMjFhNjVi
Yy4uNDU2MDVhNTIwYmM4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zY3NpL2hpc2lfc2FzL2hp
c2lfc2FzX3YzX2h3LmMKPiA+ICsrKyBiL2RyaXZlcnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192
M19ody5jCj4gPiBAQCAtMzM3NCwxMyArMzM3NCwxMyBAQCBlbnVtIHsKPiA+ICAgCWhpcDA4LAo+
ID4gICB9Owo+ID4gLXN0YXRpYyBpbnQgaGlzaV9zYXNfdjNfc3VzcGVuZChzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgcG1fbWVzc2FnZV90IHN0YXRlKQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQgaGlzaV9zYXNfdjNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXZfZCkKPiA+ICAgewo+ID4g
KwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2X2QpOwo+ID4gICAJc3RydWN0
IHNhc19oYV9zdHJ1Y3QgKnNoYSA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiA+ICAgCXN0cnVj
dCBoaXNpX2hiYSAqaGlzaV9oYmEgPSBzaGEtPmxsZGRfaGE7Cj4gPiAgIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBoaXNpX2hiYS0+ZGV2Owo+ID4gICAJc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBo
aXNpX2hiYS0+c2hvc3Q7Cj4gPiAtCXBjaV9wb3dlcl90IGRldmljZV9zdGF0ZTsKPiA+ICAgCWlu
dCByYzsKPiA+ICAgCWlmICghcGRldi0+cG1fY2FwKSB7Cj4gPiBAQCAtMzQwNiwyMSArMzQwNiwx
NSBAQCBzdGF0aWMgaW50IGhpc2lfc2FzX3YzX3N1c3BlbmQoc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHBtX21lc3NhZ2VfdCBzdGF0ZSkKPiA+ICAgCWhpc2lfc2FzX2luaXRfbWVtKGhpc2lfaGJhKTsK
PiA+IC0JZGV2aWNlX3N0YXRlID0gcGNpX2Nob29zZV9zdGF0ZShwZGV2LCBzdGF0ZSk7Cj4gPiAt
CWRldl93YXJuKGRldiwgImVudGVyaW5nIG9wZXJhdGluZyBzdGF0ZSBbRCVkXVxuIiwKPiA+IC0J
CQlkZXZpY2Vfc3RhdGUpOwo+IAo+IFBsZWFzZSByZXRhaW4gYWJvdmUgcHJpbnQgdG8ga2VlcCBj
b25zaXN0ZW5jZSB3aXRoIHRoZSBwcmludCBpbiBmdW5jdGlvbgo+IGhpc2lfc2FzX3YzX3Jlc3Vt
ZSgpLgo+Ck9rYXksIFRoYW5rcyBmb3IgdGhlIHJldmlldyA6KQpUaGlzIGlzIHdpbGwgYmUgZml4
ZWQgaW4gdjIgcGF0Y2gtc2VyaWVzIGFsb25nIHdpdGggb3RoZXIgY2hhbmdlcy4KCi0tIFZhaWJo
YXYgR3VwdGEgCj4gPiAtCXBjaV9zYXZlX3N0YXRlKHBkZXYpOwo+ID4gLQlwY2lfZGlzYWJsZV9k
ZXZpY2UocGRldik7Cj4gPiAtCXBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgZGV2aWNlX3N0YXRl
KTsKPiA+IC0KPiA+ICAgCWhpc2lfc2FzX3JlbGVhc2VfdGFza3MoaGlzaV9oYmEpOwo+ID4gICAJ
c2FzX3N1c3BlbmRfaGEoc2hhKTsKPiA+ICAgCXJldHVybiAwOwo+ID4gICB9Cj4gPiAtc3RhdGlj
IGludCBoaXNpX3Nhc192M19yZXN1bWUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiArc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBoaXNpX3Nhc192M19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
X2QpCj4gPiAgIHsKPiA+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldl9k
KTsKPiA+ICAgCXN0cnVjdCBzYXNfaGFfc3RydWN0ICpzaGEgPSBwY2lfZ2V0X2RydmRhdGEocGRl
dik7Cj4gPiAgIAlzdHJ1Y3QgaGlzaV9oYmEgKmhpc2lfaGJhID0gc2hhLT5sbGRkX2hhOwo+ID4g
ICAJc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBoaXNpX2hiYS0+c2hvc3Q7Cj4gPiBAQCAtMzQz
MCwxNiArMzQyNCw4IEBAIHN0YXRpYyBpbnQgaGlzaV9zYXNfdjNfcmVzdW1lKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQo+ID4gICAJZGV2X3dhcm4oZGV2LCAicmVzdW1pbmcgZnJvbSBvcGVyYXRpbmcg
c3RhdGUgW0QlZF1cbiIsCj4gPiAgIAkJIGRldmljZV9zdGF0ZSk7Cj4gPiAtCXBjaV9zZXRfcG93
ZXJfc3RhdGUocGRldiwgUENJX0QwKTsKPiA+IC0JcGNpX2VuYWJsZV93YWtlKHBkZXYsIFBDSV9E
MCwgMCk7Cj4gPiAtCXBjaV9yZXN0b3JlX3N0YXRlKHBkZXYpOwo+ID4gLQlyYyA9IHBjaV9lbmFi
bGVfZGV2aWNlKHBkZXYpOwo+ID4gLQlpZiAocmMpIHsKPiA+IC0JCWRldl9lcnIoZGV2LCAiZW5h
YmxlIGRldmljZSBmYWlsZWQgZHVyaW5nIHJlc3VtZSAoJWQpXG4iLCByYyk7Cj4gPiAtCQlyZXR1
cm4gcmM7Cj4gPiAtCX0KPiA+ICsJZGV2aWNlX3dha2V1cF9kaXNhYmxlKGRldl9kKTsKPiA+IC0J
cGNpX3NldF9tYXN0ZXIocGRldik7Cj4gPiAgIAlzY3NpX3VuYmxvY2tfcmVxdWVzdHMoc2hvc3Qp
Owo+ID4gICAJY2xlYXJfYml0KEhJU0lfU0FTX1JFSkVDVF9DTURfQklULCAmaGlzaV9oYmEtPmZs
YWdzKTsKPiA+IEBAIC0zNDQ3LDcgKzM0MzMsNiBAQCBzdGF0aWMgaW50IGhpc2lfc2FzX3YzX3Jl
c3VtZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICAgCXJjID0gaHdfaW5pdF92M19odyhoaXNp
X2hiYSk7Cj4gPiAgIAlpZiAocmMpIHsKPiA+ICAgCQlzY3NpX3JlbW92ZV9ob3N0KHNob3N0KTsK
PiA+IC0JCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiA+ICAgCQlyZXR1cm4gcmM7Cj4gPiAg
IAl9Cj4gPiAgIAloaXNpX2hiYS0+aHctPnBoeXNfaW5pdChoaXNpX2hiYSk7Cj4gPiBAQCAtMzQ2
OCwxMyArMzQ1MywxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcnJvcl9oYW5kbGVycyBo
aXNpX3Nhc19lcnJfaGFuZGxlciA9IHsKPiA+ICAgCS5yZXNldF9kb25lCT0gaGlzaV9zYXNfcmVz
ZXRfZG9uZV92M19odywKPiA+ICAgfTsKPiA+ICtzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoaGlz
aV9zYXNfdjNfcG1fb3BzLAo+ID4gKwkJCSBoaXNpX3Nhc192M19zdXNwZW5kLAo+ID4gKwkJCSBo
aXNpX3Nhc192M19yZXN1bWUpOwo+ID4gKwo+ID4gICBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIg
c2FzX3YzX3BjaV9kcml2ZXIgPSB7Cj4gPiAgIAkubmFtZQkJPSBEUlZfTkFNRSwKPiA+ICAgCS5p
ZF90YWJsZQk9IHNhc192M19wY2lfdGFibGUsCj4gPiAgIAkucHJvYmUJCT0gaGlzaV9zYXNfdjNf
cHJvYmUsCj4gPiAgIAkucmVtb3ZlCQk9IGhpc2lfc2FzX3YzX3JlbW92ZSwKPiA+IC0JLnN1c3Bl
bmQJPSBoaXNpX3Nhc192M19zdXNwZW5kLAo+ID4gLQkucmVzdW1lCQk9IGhpc2lfc2FzX3YzX3Jl
c3VtZSwKPiA+ICsJLmRyaXZlci5wbQk9ICZoaXNpX3Nhc192M19wbV9vcHMsCj4gPiAgIAkuZXJy
X2hhbmRsZXIJPSAmaGlzaV9zYXNfZXJyX2hhbmRsZXIsCj4gPiAgIH07Cj4gCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50
ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
