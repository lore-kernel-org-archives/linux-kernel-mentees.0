Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA0CDB46E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 13:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA8D241F12;
	Thu, 12 Oct 2023 13:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA8D241F12
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UW5dTLEi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmjTXBDk7m2B; Thu, 12 Oct 2023 13:43:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5682F41EFE;
	Thu, 12 Oct 2023 13:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5682F41EFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39901C0071;
	Thu, 12 Oct 2023 13:43:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEB1FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A1B760BB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 13:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1B760BB8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UW5dTLEi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaOtuuOv8Oq0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 13:43:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8122960AE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 13:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8122960AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697118224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YeQNCi5I9TqMhLfVG8VlYOgAuXpSTrcqQ3sfxubQaM=;
 b=UW5dTLEieNc5/Pr17cOxrw8f+cyypi0QSoZLDcLsxAEYhq7vcRStRCJTdfEqD5zyWdya0q
 ge8/gseJE2tqqi4KqnuALWIwrjh5ha9dKgO3jrJgaJqEahj6/nqtx9NG0zQNSumF0PNm62
 puOHFG0dGFN6kr5CAvkCRmQu9oktp/M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-asyzyPDFMSiRDAc08F7dSA-1; Thu, 12 Oct 2023 09:43:42 -0400
X-MC-Unique: asyzyPDFMSiRDAc08F7dSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e26bbbc63so218459a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 06:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118222; x=1697723022;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YeQNCi5I9TqMhLfVG8VlYOgAuXpSTrcqQ3sfxubQaM=;
 b=Pw/RbMKuO4jP7OOMbbRjMUhFe36slw3IzppCqd9mB4vfSsI5Tf8fF+eYP32XqoK5c5
 gSuyKL/0ag4BKNAnJlA6xUC4bqPJvyIqIoLI2QxFtQclGPH+AUS65Yni0XUKJMTXnox8
 Ma4vB1QzkhGYxoTl1+We6yYLhUTT0UAk92VIzHV0jbxUe64gonHnL24dhCO0ltkfBcEi
 3n5xLATOlH4U2ye3c8PkvZ7aXvHzMzh4kqCV+LdAex0gncUgBQ1u5mcgB9F/BxFrogu0
 /Ot1j5kZ8Pkb+48S0wMEfxhfUJhY0VTpph35QkDtKv1L3szh9m73enwbLZfSTL3ICuvq
 df4A==
X-Gm-Message-State: AOJu0YzEmS/XmScHRCJ9tRTSPGodebrfD5OVQt/ZTYr9XMeWi//sx897
 +Qn30FJsPBUas1d97R87nNu94581Yl5Zef1/+VZSNW4cYooMeRe5/Pt4QKHaXYlq+uQPMBGs5OM
 VtPkJTgvClOyfZyHZ8ZJqyibQapqLbzR/GtUArwzLfsCHmu8H
X-Received: by 2002:a05:6402:371a:b0:53d:af00:1682 with SMTP id
 ek26-20020a056402371a00b0053daf001682mr5374476edb.40.1697118221754; 
 Thu, 12 Oct 2023 06:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYrju74xO7Ncjxi1ob/0f1czuvGBIQLn9BbOM3AmEu++kZS53RZ8hOyqwr78oMVbrKwJ/ffw==
X-Received: by 2002:a05:6402:371a:b0:53d:af00:1682 with SMTP id
 ek26-20020a056402371a00b0053daf001682mr5374460edb.40.1697118221361; 
 Thu, 12 Oct 2023 06:43:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 d5-20020aa7ce05000000b005346a263bb1sm10062063edv.63.2023.10.12.06.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 06:43:40 -0700 (PDT)
Message-ID: <9faf1a1a-af49-5f6f-9f33-6cf57f884c44@redhat.com>
Date: Thu, 12 Oct 2023 15:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] kvm/sev: remove redundant MISC_CG_RES_SEV_ES
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 seanjc@google.com, skhan@linuxfoundation.org
References: <20231010174932.29769-1-jose.pekkarinen@foxhound.fi>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20231010174932.29769-1-jose.pekkarinen@foxhound.fi>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: x86@kernel.org, kvm@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMTAvMTAvMjMgMTk6NDksIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gU0VWLUVTIGlzIGFu
IGV4dHJhIGVuY3J5cHRlZCBzdGF0ZSB0aGF0IHNoYXJlcyBjb21tb24gcmVzb3VyY2VzCj4gd2l0
aCBTRVYuIFVzaW5nIGFuIGV4dHJhIENHIGZvciBpdHMgcHVycG9zZSBkb2Vzbid0IHNlZW0gdG8K
PiBwcm92aWRlIG11Y2ggdmFsdWUuIFRoaXMgcGF0Y2ggd2lsbCBjbGVhbiB1cCB0aGUgY29udHJv
bCBncm91cAo+IGFsb25nIHdpdGggbXVsdGlwbGUgY2hlY2tzIHRoYXQgYmVjb21lIHJlZHVuZGFu
dCB3aXRoIGl0Lgo+IAo+IFRoZSBwYXRjaCB3aWxsIGFsc28gcmVtb3ZlIGEgcmVkdW5kYW50IGxv
Z2ljIG9uIHNldiBpbml0aWFsaXphdGlvbgo+IHRoYXQgcHJvZHVjZXMgU0VWLUVTIHRvIGJlIGRp
c2FibGVkLCB3aGlsZSBzdXBwb3J0ZWQgYnkgdGhlIGNwdQo+IGFuZCByZXF1ZXN0ZWQgYnkgdGhl
IHVzZXIgdGhyb3VnaCB0aGUgc2V2X2VzIHBhcmFtZXRlci4KCkluIHdoYXQgc2Vuc2UgaXMgaXQg
c2hhcmVkPyAgVGhlIFNFViBBU0lEcyBhbmQgdGhlIFNFVi1FUyBBU0lEcyBhcmUgCnNlcGFyYXRl
IChhbmQgaW4gYm90aCBjYXNlcyBsaW1pdGVkKSByZXNvdXJjZXMsIGFuZCB0aGVyZWZvcmUgdGhl
eSBoYXZlIApzZXBhcmF0ZSBjZ3JvdXBzLgoKUGFvbG8KCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
UGVra2FyaW5lbjxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Cj4gLS0tCj4gICBhcmNoL3g4
Ni9rdm0vc3ZtL3Nldi5jICAgICAgfCAxOCArKystLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUv
bGludXgvbWlzY19jZ3JvdXAuaCB8ICAyIC0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9z
dm0vc2V2LmMgYi9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCj4gaW5kZXggMDc3NTZiNzM0OGFlLi44
YTA2ZDkyMTg3Y2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zZXYuYwo+ICsrKyBi
L2FyY2gveDg2L2t2bS9zdm0vc2V2LmMKPiBAQCAtMzcsMTMgKzM3LDkgQEAKPiAgICAqIHRoaXMg
ZmlsZSBhcmUgbm90IHVzZWQgYnV0IHRoaXMgZmlsZSBzdGlsbCBnZXRzIGNvbXBpbGVkIGludG8g
dGhlIEtWTSBBTUQKPiAgICAqIG1vZHVsZS4KPiAgICAqCj4gLSAqIFdlIHdpbGwgbm90IGhhdmUg
TUlTQ19DR19SRVNfU0VWIGFuZCBNSVNDX0NHX1JFU19TRVZfRVMgZW50cmllcyBpbiB0aGUgZW51
bQo+IC0gKiBtaXNjX3Jlc190eXBlIHt9IGRlZmluZWQgaW4gbGludXgvbWlzY19jZ3JvdXAuaC4K
PiAtICoKPiAgICAqIEJlbG93IG1hY3JvcyBhbGxvdyBjb21waWxhdGlvbiB0byBzdWNjZWVkLgo+
ICAgICovCj4gICAjZGVmaW5lIE1JU0NfQ0dfUkVTX1NFViBNSVNDX0NHX1JFU19UWVBFUwo+IC0j
ZGVmaW5lIE1JU0NfQ0dfUkVTX1NFVl9FUyBNSVNDX0NHX1JFU19UWVBFUwo+ICAgI2VuZGlmCj4g
ICAKPiAgICNpZmRlZiBDT05GSUdfS1ZNX0FNRF9TRVYKPiBAQCAtMTI1LDEzICsxMjEsMTMgQEAg
c3RhdGljIGJvb2wgX19zZXZfcmVjeWNsZV9hc2lkcyhpbnQgbWluX2FzaWQsIGludCBtYXhfYXNp
ZCkKPiAgIAo+ICAgc3RhdGljIGludCBzZXZfbWlzY19jZ190cnlfY2hhcmdlKHN0cnVjdCBrdm1f
c2V2X2luZm8gKnNldikKPiAgIHsKPiAtCWVudW0gbWlzY19yZXNfdHlwZSB0eXBlID0gc2V2LT5l
c19hY3RpdmUgPyBNSVNDX0NHX1JFU19TRVZfRVMgOiBNSVNDX0NHX1JFU19TRVY7Cj4gKwllbnVt
IG1pc2NfcmVzX3R5cGUgdHlwZSA9IE1JU0NfQ0dfUkVTX1NFVjsKPiAgIAlyZXR1cm4gbWlzY19j
Z190cnlfY2hhcmdlKHR5cGUsIHNldi0+bWlzY19jZywgMSk7Cj4gICB9Cj4gICAKPiAgIHN0YXRp
YyB2b2lkIHNldl9taXNjX2NnX3VuY2hhcmdlKHN0cnVjdCBrdm1fc2V2X2luZm8gKnNldikKPiAg
IHsKPiAtCWVudW0gbWlzY19yZXNfdHlwZSB0eXBlID0gc2V2LT5lc19hY3RpdmUgPyBNSVNDX0NH
X1JFU19TRVZfRVMgOiBNSVNDX0NHX1JFU19TRVY7Cj4gKwllbnVtIG1pc2NfcmVzX3R5cGUgdHlw
ZSA9IE1JU0NfQ0dfUkVTX1NFVjsKPiAgIAltaXNjX2NnX3VuY2hhcmdlKHR5cGUsIHNldi0+bWlz
Y19jZywgMSk7Cj4gICB9Cj4gICAKPiBAQCAtMjE2Nyw3ICsyMTYzLDcgQEAgdm9pZCBfX2luaXQg
c2V2X3NldF9jcHVfY2Fwcyh2b2lkKQo+ICAgdm9pZCBfX2luaXQgc2V2X2hhcmR3YXJlX3NldHVw
KHZvaWQpCj4gICB7Cj4gICAjaWZkZWYgQ09ORklHX0tWTV9BTURfU0VWCj4gLQl1bnNpZ25lZCBp
bnQgZWF4LCBlYngsIGVjeCwgZWR4LCBzZXZfYXNpZF9jb3VudCwgc2V2X2VzX2FzaWRfY291bnQ7
Cj4gKwl1bnNpZ25lZCBpbnQgZWF4LCBlYngsIGVjeCwgZWR4LCBzZXZfYXNpZF9jb3VudDsKPiAg
IAlib29sIHNldl9lc19zdXBwb3J0ZWQgPSBmYWxzZTsKPiAgIAlib29sIHNldl9zdXBwb3J0ZWQg
PSBmYWxzZTsKPiAgIAo+IEBAIC0yMjM2LDE0ICsyMjMyLDcgQEAgdm9pZCBfX2luaXQgc2V2X2hh
cmR3YXJlX3NldHVwKHZvaWQpCj4gICAJaWYgKCFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0VW
X0VTKSkKPiAgIAkJZ290byBvdXQ7Cj4gICAKPiAtCS8qIEhhcyB0aGUgc3lzdGVtIGJlZW4gYWxs
b2NhdGVkIEFTSURzIGZvciBTRVYtRVM/ICovCj4gLQlpZiAobWluX3Nldl9hc2lkID09IDEpCj4g
LQkJZ290byBvdXQ7Cj4gLQo+IC0Jc2V2X2VzX2FzaWRfY291bnQgPSBtaW5fc2V2X2FzaWQgLSAx
Owo+IC0JV0FSTl9PTl9PTkNFKG1pc2NfY2dfc2V0X2NhcGFjaXR5KE1JU0NfQ0dfUkVTX1NFVl9F
Uywgc2V2X2VzX2FzaWRfY291bnQpKTsKPiAgIAlzZXZfZXNfc3VwcG9ydGVkID0gdHJ1ZTsKPiAt
Cj4gICBvdXQ6Cj4gICAJaWYgKGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TRVYpKQo+ICAgCQlw
cl9pbmZvKCJTRVYgJXMgKEFTSURzICV1IC0gJXUpXG4iLAo+IEBAIC0yMjcxLDcgKzIyNjAsNiBA
QCB2b2lkIHNldl9oYXJkd2FyZV91bnNldHVwKHZvaWQpCj4gICAJYml0bWFwX2ZyZWUoc2V2X3Jl
Y2xhaW1fYXNpZF9iaXRtYXApOwo+ICAgCj4gICAJbWlzY19jZ19zZXRfY2FwYWNpdHkoTUlTQ19D
R19SRVNfU0VWLCAwKTsKPiAtCW1pc2NfY2dfc2V0X2NhcGFjaXR5KE1JU0NfQ0dfUkVTX1NFVl9F
UywgMCk7Cj4gICB9Cj4gICAKPiAgIGludCBzZXZfY3B1X2luaXQoc3RydWN0IHN2bV9jcHVfZGF0
YSAqc2QpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlzY19jZ3JvdXAuaCBiL2luY2x1
ZGUvbGludXgvbWlzY19jZ3JvdXAuaAo+IGluZGV4IGMyMzgyMDdkMTYxNS4uMjNkM2NkMTUzZjYw
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWlzY19jZ3JvdXAuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbWlzY19jZ3JvdXAuaAo+IEBAIC0xNSw4ICsxNSw2IEBAIGVudW0gbWlzY19yZXNf
dHlwZSB7Cj4gICAjaWZkZWYgQ09ORklHX0tWTV9BTURfU0VWCj4gICAJLyogQU1EIFNFViBBU0lE
cyByZXNvdXJjZSAqLwo+ICAgCU1JU0NfQ0dfUkVTX1NFViwKPiAtCS8qIEFNRCBTRVYtRVMgQVNJ
RHMgcmVzb3VyY2UgKi8KPiAtCU1JU0NfQ0dfUkVTX1NFVl9FUywKPiAgICNlbmRpZgo+ICAgCU1J
U0NfQ0dfUkVTX1RZUEVTCj4gICB9Owo+IC0tIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0Ckxp
bnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRl
ZXMK
