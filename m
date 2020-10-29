Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5380C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:17:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB7A2076E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5RbO63B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB7A2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74A6E87265;
	Thu, 29 Oct 2020 15:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhGhFjp58eO3; Thu, 29 Oct 2020 15:17:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC773871CF;
	Thu, 29 Oct 2020 15:17:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2B01C088B;
	Thu, 29 Oct 2020 15:17:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E7D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D83C86BAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKcJi6_jXOsY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:17:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 817A586B8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:17:05 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y14so2563099pfp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=820MwFgEaA13M8USX5NcXNh7ShnWbqQ8vCMeLhpqcYs=;
 b=S5RbO63BxB+kSye4StTkySYsW8Zr4FA0vnzixmEkiwTQwE1vI/VjWC2hHXLdQO05Gw
 a2OenMl3LvspcJH/IRGLgGitvwqaukn7G8DrfU3oHDyTezcCEYj6xklXXFYhOo1NNYKI
 QVPMrB3mSSSzLggNqwokNIJnKFLIwJlXJ1J1+NwtbTBbaxgqc3WCf4oBbVZlt9iVDuS+
 wsvt+vLSQKbDFDNJ80WPqsEOFSPCjg/7nS9LmMBSiUnlSpDYC5guEqq8Nqg3DIlF0yRD
 orGh7uZuojFX9L9p7wSa1qHFVzik6JXcOt89LntoOjmwSP7G1c713NE8tzeAa7uLzt6X
 EYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=820MwFgEaA13M8USX5NcXNh7ShnWbqQ8vCMeLhpqcYs=;
 b=Nz+Qc2odTV3WntpIbCfMuR0oZPypcMVDt/CHB3hAZU3y0DzbSCv6v8C3DB8h+8AucL
 8KwxUjmTxrNriLp2SbDWNzi523ElHFHwhTiL3RNk9wTSk2KSH2LZFGOas3boR5MeSIG9
 ateC3kbrZkQMytiu5TOYLuHMHz7NYPKSvzxk6uSIRjtE39KXoiQLSKch0Bu3ZOizDsnE
 4NNDZ5WnAdnKRPOPRIeWODM+tuLErS9btP17O1n69NIA09tFrASK8lQqqAU0E+WNwEMN
 CL6VSB5N8hCo7Qswq6xtq1W+aicT9YG3maVKguwzTXDXQmZd96/d+DRyoR3hG3VdvlJQ
 oW9A==
X-Gm-Message-State: AOAM530CkmzLsDkwXoP7y+F3PxoJfgkOHI/eMv73a5ivw3y0mN7y9wFi
 y3Ufg01cTGqr1vpdCl0vD3F+QPJjdp0YFB6Yh2Q=
X-Google-Smtp-Source: ABdhPJyY7nixg8TY+WgurAXV+U5HGT8ffPpFyIyVTq773koSVeFgvAYxC4fluR9lXWYW2NDB40cO4g==
X-Received: by 2002:a17:90a:be18:: with SMTP id
 a24mr231009pjs.215.1603984624439; 
 Thu, 29 Oct 2020 08:17:04 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.222.191])
 by smtp.gmail.com with ESMTPSA id b3sm3143476pfd.66.2020.10.29.08.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 08:17:03 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
 <20201029132256.11793-1-anant.thazhemadam@gmail.com>
Message-ID: <d8417f98-0896-25d0-e72d-dcf111011129@gmail.com>
Date: Thu, 29 Oct 2020 20:46:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: usbnet: update
 __usbnet_{read|write}_cmd() to use new API
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

Ck9uIDI5LzEwLzIwIDY6NTIgcG0sIEFuYW50IFRoYXpoZW1hZGFtIHdyb3RlOgo+IEN1cnJlbnRs
eSwgX191c2JuZXRfe3JlYWR8d3JpdGV9X2NtZCgpIHVzZSB1c2JfY29udHJvbF9tc2coKSwKPiBh
bmQgdGh1cyBjb25zaWRlciBwb3RlbnRpYWwgcGFydGlhbCByZWFkcy93cml0ZXMgYmVpbmcgZG9u
ZSB0byAKPiBiZSBwZXJmZWN0bHkgdmFsaWQuCj4gUXVpdGUgYSBmZXcgY2FsbGVycyBvZiB1c2Ju
ZXRfe3JlYWR8d3JpdGV9X2NtZCgpIGRvbid0IGVuZm9yY2UKPiBjaGVja2luZyBmb3IgcGFydGlh
bCByZWFkcy93cml0ZXMgaW50byBhY2NvdW50IGVpdGhlciwgYXV0b21hdGljYWxseQo+IGFzc3Vt
aW5nIHRoYXQgYSBjb21wbGV0ZSByZWFkL3dyaXRlIG9jY3Vycy4KPgo+IEhvd2V2ZXIsIHRoZSBu
ZXcgdXNiX2NvbnRyb2xfbXNnX3tzZW5kfHJlY3Z9KCkgQVBJcyBkb24ndCBhbGxvdyBwYXJ0aWFs
Cj4gcmVhZHMgYW5kIHdyaXRlcy4KPiBVc2luZyB0aGUgbmV3IEFQSXMgYWxzbyByZWxheGVzIHRo
ZSByZXR1cm4gdmFsdWUgY2hlY2tpbmcgdGhhdCBtdXN0Cj4gYmUgZG9uZSBhZnRlciB1c2JuZXRf
e3JlYWR8d3JpdGV9X2NtZCgpIGlzIGNhbGxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuYW50IFRo
YXpoZW1hZGFtIDxhbmFudC50aGF6aGVtYWRhbUBnbWFpbC5jb20+IDxtYWlsdG86YW5hbnQudGhh
emhlbWFkYW1AZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gCSogRml4IGJ1aWxk
IGVycm9yCj4KPiBUaGlzIHBhdGNoIGhhcyBiZWVuIGNvbXBpbGUgYW5kIGJ1aWxkIHRlc3RlZCB3
aXRoIGEgLmNvbmZpZyBmaWxlIHRoYXQKPiB3YXMgZ2VuZXJhdGVkIHVzaW5nIG1ha2UgYWxseWVz
Y29uZmlnLCBhbmQgdGhlIGJ1aWxkIGVycm9yIGhhcyBiZWVuIAo+IGZpeGVkLgo+IFVuZm9ydHVu
YXRlbHksIEkgd2Fzbid0IGFibGUgdG8gZ2V0IG15IGhhbmRzIG9uIGEgdXNibmV0IGFkYXB0ZXIg
Zm9yIHRlc3RpbmcsCj4gYW5kIHdvdWxkIGFwcHJlY2lhdGUgaXQgaWYgc29tZW9uZSBjb3VsZCBk
byB0aGF0Lgo+Cj4gIGRyaXZlcnMvbmV0L3VzYi91c2JuZXQuYyB8IDUyICsrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDQyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3VzYi91
c2JuZXQuYyBiL2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYwo+IGluZGV4IGJmNmM1ODI0MGJkNC4u
MmY3YzdiN2Y0MDQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYwo+IEBAIC0xOTgyLDY0ICsxOTgyLDMyIEBAIEVY
UE9SVF9TWU1CT0wodXNibmV0X2xpbmtfY2hhbmdlKTsKPiAgc3RhdGljIGludCBfX3VzYm5ldF9y
ZWFkX2NtZChzdHJ1Y3QgdXNibmV0ICpkZXYsIHU4IGNtZCwgdTggcmVxdHlwZSwKPiAgCQkJICAg
ICB1MTYgdmFsdWUsIHUxNiBpbmRleCwgdm9pZCAqZGF0YSwgdTE2IHNpemUpCj4gIHsKPiAtCXZv
aWQgKmJ1ZiA9IE5VTEw7Cj4gLQlpbnQgZXJyID0gLUVOT01FTTsKPiAgCj4gIAluZXRkZXZfZGJn
KGRldi0+bmV0LCAidXNibmV0X3JlYWRfY21kIGNtZD0weCUwMnggcmVxdHlwZT0lMDJ4Igo+ICAJ
CSAgICIgdmFsdWU9MHglMDR4IGluZGV4PTB4JTA0eCBzaXplPSVkXG4iLAo+ICAJCSAgIGNtZCwg
cmVxdHlwZSwgdmFsdWUsIGluZGV4LCBzaXplKTsKPiAgCj4gLQlpZiAoc2l6ZSkgewo+IC0JCWJ1
ZiA9IGttYWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gLQkJaWYgKCFidWYpCj4gLQkJCWdvdG8g
b3V0Owo+IC0JfQo+IC0KPiAtCWVyciA9IHVzYl9jb250cm9sX21zZyhkZXYtPnVkZXYsIHVzYl9y
Y3ZjdHJscGlwZShkZXYtPnVkZXYsIDApLAo+IC0JCQkgICAgICBjbWQsIHJlcXR5cGUsIHZhbHVl
LCBpbmRleCwgYnVmLCBzaXplLAo+IC0JCQkgICAgICBVU0JfQ1RSTF9HRVRfVElNRU9VVCk7Cj4g
LQlpZiAoZXJyID4gMCAmJiBlcnIgPD0gc2l6ZSkgewo+IC0gICAgICAgIGlmIChkYXRhKQo+IC0g
ICAgICAgICAgICBtZW1jcHkoZGF0YSwgYnVmLCBlcnIpOwo+IC0gICAgICAgIGVsc2UKPiAtICAg
ICAgICAgICAgbmV0ZGV2X2RiZyhkZXYtPm5ldCwKPiAtICAgICAgICAgICAgICAgICJIdWg/IERh
dGEgcmVxdWVzdGVkIGJ1dCB0aHJvd24gYXdheS5cbiIpOwo+IC0gICAgfQo+IC0Ja2ZyZWUoYnVm
KTsKPiAtb3V0Ogo+IC0JcmV0dXJuIGVycjsKPiArCXJldHVybiB1c2JfY29udHJvbF9tc2dfcmVj
dihkZXYtPnVkZXYsIDAsCj4gKwkJCSAgICAgIGNtZCwgcmVxdHlwZSwgdmFsdWUsIGluZGV4LCBk
YXRhLCBzaXplLAo+ICsJCQkgICAgICBVU0JfQ1RSTF9HRVRfVElNRU9VVCwgR0ZQX0tFUk5FTCk7
Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgX191c2JuZXRfd3JpdGVfY21kKHN0cnVjdCB1c2JuZXQg
KmRldiwgdTggY21kLCB1OCByZXF0eXBlLAo+ICAJCQkgICAgICB1MTYgdmFsdWUsIHUxNiBpbmRl
eCwgY29uc3Qgdm9pZCAqZGF0YSwKPiAgCQkJICAgICAgdTE2IHNpemUpCj4gIHsKPiAtCXZvaWQg
KmJ1ZiA9IE5VTEw7Cj4gLQlpbnQgZXJyID0gLUVOT01FTTsKPiAtCj4gIAluZXRkZXZfZGJnKGRl
di0+bmV0LCAidXNibmV0X3dyaXRlX2NtZCBjbWQ9MHglMDJ4IHJlcXR5cGU9JTAyeCIKPiAgCQkg
ICAiIHZhbHVlPTB4JTA0eCBpbmRleD0weCUwNHggc2l6ZT0lZFxuIiwKPiAgCQkgICBjbWQsIHJl
cXR5cGUsIHZhbHVlLCBpbmRleCwgc2l6ZSk7Cj4gIAo+IC0JaWYgKGRhdGEpIHsKPiAtCQlidWYg
PSBrbWVtZHVwKGRhdGEsIHNpemUsIEdGUF9LRVJORUwpOwo+IC0JCWlmICghYnVmKQo+IC0JCQln
b3RvIG91dDsKPiAtCX0gZWxzZSB7Cj4gLSAgICAgICAgaWYgKHNpemUpIHsKPiAtICAgICAgICAg
ICAgV0FSTl9PTl9PTkNFKDEpOwo+IC0gICAgICAgICAgICBlcnIgPSAtRUlOVkFMOwo+IC0gICAg
ICAgICAgICBnb3RvIG91dDsKPiAtICAgICAgICB9Cj4gLSAgICB9Cj4gLQo+IC0JZXJyID0gdXNi
X2NvbnRyb2xfbXNnKGRldi0+dWRldiwgdXNiX3NuZGN0cmxwaXBlKGRldi0+dWRldiwgMCksCj4g
LQkJCSAgICAgIGNtZCwgcmVxdHlwZSwgdmFsdWUsIGluZGV4LCBidWYsIHNpemUsCj4gLQkJCSAg
ICAgIFVTQl9DVFJMX1NFVF9USU1FT1VUKTsKPiAtCWtmcmVlKGJ1Zik7Cj4gKwlpZiAoc2l6ZSAm
JiAhZGF0YSkgewo+ICsJCVdBUk5fT05fT05DRSgxKTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAr
CX0KPiAgCj4gLW91dDoKPiAtCXJldHVybiBlcnI7Cj4gKwlyZXR1cm4gdXNiX2NvbnRyb2xfbXNn
X3NlbmQoZGV2LT51ZGV2LCAwLAo+ICsJCQljbWQsIHJlcXR5cGUsIHZhbHVlLCBpbmRleCwgZGF0
YSwgc2l6ZSwKPiArCQkJVVNCX0NUUkxfU0VUX1RJTUVPVVQsIEdGUF9LRVJORUwpOwo+ICB9Cj4g
IAo+ICAvKgoKSSBoYWQgYSB2MiBwcmVwYXJlZCBhbmQgcmVhZHkgYnV0IHdhcyB0b2xkIHRvIHdh
aXQgZm9yIGEgd2VlayBiZWZvcmUgc2VuZGluZyBpdCBpbiwKc2luY2UgdXNiX2NvbnRyb2xfbXNn
X3tzZW5kfHJlY3Z9KCkgdGhhdCB3ZXJlIGJlaW5nIHVzZWQgd2VyZSBub3QgcHJlc2VudCBpbiB0
aGUKbmV0d29ya2luZyB0cmVlIGF0IHRoZSB0aW1lLCBhbmQgYWxsIHRoZSB0cmVlcyB3b3VsZCBi
ZcKgY29udmVyZ2VkIGJ5IHRoZW4uClNvLCBqdXN0IHRvIGJlIG9uIHRoZSBzYWZlciBzaWRlLCBJ
IHdhaXRlZCBmb3IgdHdvIHdlZWtzLgpJIGNoZWNrZWQgdGhlIG5ldCB0cmVlLCBhbmQgZm91bmQg
dGhlIEFQSXMgdGhlcmUgdG9vIChkZWZpbmVkIGluIHVzYi5oKS4KCkhvd2V2ZXIgdGhlIGJ1aWxk
IHNlZW1zIHRvIGZhaWwgaGVyZSwKwqDCoMKgIGh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0
dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZy90aHJlYWQvTzJCRVJHTjdTWVlDNkxOT09L
TlVHUFMySUpMRFdZVDcvCgpJJ20gbm90IGVudGlyZWx5IHN1cmUgYXQgdGhpcyBwb2ludCB3aHkg
dGhpcyBpcyBoYXBwZW5pbmcsIGFuZCB3b3VsZCBhcHByZWNpYXRlIGl0IGlmCnNvbWVvbmUgY291
bGQgdGFrZSB0aGUgdGltZSB0byB0ZWxsIG1lIGlmIGFuZCBob3cgdGhpcyBtaWdodCBiZSBhbiBp
c3N1ZSB3aXRoIG15CnBhdGNoLgoKVGhhbmtzLApBbmFudAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
