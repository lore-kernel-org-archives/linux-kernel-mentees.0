Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290ACC74A5B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Mar 2023 00:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8866E8418E;
	Thu, 30 Mar 2023 00:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8866E8418E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RQwnmDix
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeYi3LqpDoVu; Thu, 30 Mar 2023 00:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6B12784023;
	Thu, 30 Mar 2023 00:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B12784023
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4415CC0037;
	Thu, 30 Mar 2023 00:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 579F8C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 00:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CE398402B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 00:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE398402B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7Lp3DKVLxiW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 00:14:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D77984023
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D77984023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 00:14:35 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id fb38so11428892pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680135274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqTaJc++Fy4uDfLa9Ft8mislQO1Ik1i1kHjA6mm3OCE=;
 b=RQwnmDixUP+HPRQomoP/B6+oWwXu7KGgw5gFVbJxVr6oc17bKo+QeJS1OtPAZ/jEUZ
 eDCa/x0xH5hRckbJkWfj5F8gbC40EaTc5itNie86YmN+QLWeAtoUl70w+5W0MD1aUXUM
 aAhKl+2NcSVYvC8c/ipD9kONgK8vP6KLbET8fJU7mCuNNOZoyrOzy7celiIbuCx6BFB+
 BOBuCAFY3bHdVgOnkoIbbosIzo9CW3j7UxtnB2m5lK/BxDVugo+yTZ4cislAqz/UFQBK
 /I3vh7D9VQ6gkLJ8iJZZ392GP1cSyz01oDa/jmGxQwkVtgq/fNWnvYAiSmMEnZMvOdDD
 7MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680135274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqTaJc++Fy4uDfLa9Ft8mislQO1Ik1i1kHjA6mm3OCE=;
 b=xT1xIhTBFNDBWJRoUfacZsuXMHGGygMW2WaqJTNExKhoDtzuRfSuiRWd5+Qp1t500H
 HJfy+rdNIjm6jcvH6aqCWTzfpUyYhEV8yO6YgXYre62CtPKw9PD0vYtUXvCF622ULoNy
 qLThx+hkevg4WME4FtlxqQSONptwvjQz25vHSUGi+yFZpH12pBpEU2krl2XxTp/zz8CT
 61SoAi5LjmIih/LNrg+PtYMtvhEqxko2EyNVqRB1qg1+mkTFp4u1nzPr2om4AdRXRvE5
 7nrmcewezy3om2dTIYYzRumUy4DggtRxk2fDnt4/ZkPMtxefZ97f81KsehW00elti6k7
 Zrvg==
X-Gm-Message-State: AAQBX9f9YrTogM8odQb3rCL/qctePvkGLpYCVnGIxtW4oZ/YH7OS5CE6
 QTB1bhF/KYEPpfz3IYR5laUp2GzRVN8KRe0sLGw=
X-Google-Smtp-Source: AKy350Zq2BBdKRE15QvmxRG+ExUHY5peBCSxcGVhTnap9IqgKRDor+A2f1W6nwzESs937NDCtQfvcBlrM34mtaECKnY=
X-Received: by 2002:a05:6a00:b93:b0:62b:e52e:1bb with SMTP id
 g19-20020a056a000b9300b0062be52e01bbmr9897401pfj.0.1680135274513; Wed, 29 Mar
 2023 17:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
 <20230329145304.66add47ba9b9fafb71b1e13d@linux-foundation.org>
In-Reply-To: <20230329145304.66add47ba9b9fafb71b1e13d@linux-foundation.org>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 29 Mar 2023 17:14:23 -0700
Message-ID: <CAHbLzko=aWBPk5a1P2fgR9yAgc52WG-HX_OBV8=iWFy_D4_eNQ@mail.gmail.com>
Subject: Re: [PATCH] mm: khugepaged: Fix kernel BUG in hpage_collapse_scan_file
To: Andrew Morton <akpm@linux-foundation.org>,
 "Zach O'Keefe" <zokeefe@google.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMjo1M+KAr1BNIEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOSBNYXIgMjAyMyAxODo1Mzoz
MCArMDQwMCBJdmFuIE9ybG92IDxpdmFuLm9ybG92MDMyMkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBTeXprYWxsZXIgcmVwb3J0ZWQgdGhlIGZvbGxvd2luZyBpc3N1ZToKPiA+Cj4gPiAuLi4KPiA+
Cj4gPiBUaGUgJ3hhc19zdG9yZScgY2FsbCBkdXJpbmcgcGFnZSBjYWNoZSBzY2FubmluZyBjYW4g
cG90ZW50aWFsbHkKPiA+IHRyYW5zbGF0ZSAneGFzJyBpbnRvIHRoZSBlcnJvciBzdGF0ZSAod2l0
aCB0aGUgcmVwcm9kdWNlciBwcm92aWRlZAo+ID4gYnkgdGhlIHN5emthbGxlciB0aGUgZXJyb3Ig
Y29kZSBpcyAtRU5PTUVNKS4gSG93ZXZlciwgdGhlcmUgYXJlIG5vCj4gPiBmdXJ0aGVyIGNoZWNr
cyBhZnRlciB0aGUgJ3hhc19zdG9yZScsIGFuZCB0aGUgbmV4dCBjYWxsIG9mICd4YXNfbmV4dCcK
PiA+IGF0IHRoZSBzdGFydCBvZiB0aGUgc2Nhbm5pbmcgY3ljbGUgZG9lc24ndCBpbmNyZWFzZSB0
aGUgeGFfaW5kZXgsCj4gPiBhbmQgdGhlIGlzc3VlIG9jY3Vycy4KPiA+Cj4gPiBUaGlzIHBhdGNo
IHdpbGwgYWRkIHRoZSB4YXJyYXkgc3RhdGUgZXJyb3IgY2hlY2tpbmcgYWZ0ZXIgdGhlCj4gPiAn
eGFzX3N0b3JlJyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVzdWx0IGVycm9yIGNvZGUuCj4gPgo+
ID4gVGVzdGVkIHZpYSBzeXpib3QuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCs5NTc4ZmFh
NTQ3NWFjYjM1ZmE1MEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gPiBMaW5rOiBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/aWQ9N2Q2YmIzNzYwZTAyNmVjZTc1MjQ1MDBmZTQ0
ZmIwMjRhMGU5NTlmYwo+ID4gU2lnbmVkLW9mZi1ieTogSXZhbiBPcmxvdiA8aXZhbi5vcmxvdjAz
MjJAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgbW0va2h1Z2VwYWdlZC5jIHwgMTAgKysrKysrKysr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL21tL2todWdlcGFnZWQuYyBiL21tL2todWdlcGFnZWQuYwo+ID4gaW5kZXggOTJlNmY1NmE5
MzJkLi40ZDk4NTBkOWVhN2YgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9raHVnZXBhZ2VkLmMKPiA+ICsr
KyBiL21tL2todWdlcGFnZWQuYwo+ID4gQEAgLTU1LDYgKzU1LDcgQEAgZW51bSBzY2FuX3Jlc3Vs
dCB7Cj4gPiAgICAgICBTQ0FOX0NHUk9VUF9DSEFSR0VfRkFJTCwKPiA+ICAgICAgIFNDQU5fVFJV
TkNBVEVELAo+ID4gICAgICAgU0NBTl9QQUdFX0hBU19QUklWQVRFLAo+ID4gKyAgICAgU0NBTl9T
VE9SRV9GQUlMRUQsCj4gPiAgfTsKPiA+Cj4gPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRT
Cj4gPiBAQCAtMTg0MCw2ICsxODQxLDE1IEBAIHN0YXRpYyBpbnQgY29sbGFwc2VfZmlsZShzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhhX2xvY2tlZDsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhhc19z
dG9yZSgmeGFzLCBocGFnZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
eGFzX2Vycm9yKCZ4YXMpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIHJldmVydCBzaG1lbV9jaGFyZ2UgcGVyZm9ybWVkCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAqIGluIHRoZSBwcmV2aW91cyBjb25kaXRpb24KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1hcHBpbmctPm5ycGFnZXMtLTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2htZW1fdW5jaGFyZ2UobWFwcGluZy0+aG9z
dCwgMSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdCA9
IFNDQU5fU1RPUkVfRkFJTEVEOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIHhhX2xvY2tlZDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX25vbmUrKzsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gICAgICAgICAgICAgICAgICAgICAg
IH0KPgo+IE5lZWRzIHRoaXMsIEkgYXNzdW1lLgo+Cj4gLS0tIGEvaW5jbHVkZS90cmFjZS9ldmVu
dHMvaHVnZV9tZW1vcnkuaH5tbS1raHVnZXBhZ2VkLWZpeC1rZXJuZWwtYnVnLWluLWhwYWdlX2Nv
bGxhcHNlX3NjYW5fZmlsZS1maXgKPiArKysgYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9odWdlX21l
bW9yeS5oCj4gQEAgLTM2LDcgKzM2LDggQEAKPiAgICAgICAgIEVNKCBTQ0FOX0FMTE9DX0hVR0Vf
UEFHRV9GQUlMLCAgImFsbG9jX2h1Z2VfcGFnZV9mYWlsZWQiKSAgICAgICBcCj4gICAgICAgICBF
TSggU0NBTl9DR1JPVVBfQ0hBUkdFX0ZBSUwsICAgICJjY2dyb3VwX2NoYXJnZV9mYWlsZWQiKSAg
ICAgICAgXAo+ICAgICAgICAgRU0oIFNDQU5fVFJVTkNBVEVELCAgICAgICAgICAgICAidHJ1bmNh
dGVkIikgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgIEVNZShTQ0FOX1BBR0VfSEFTX1BS
SVZBVEUsICAgICAgInBhZ2VfaGFzX3ByaXZhdGUiKSAgICAgICAgICAgICBcCj4gKyAgICAgICBF
TSggU0NBTl9QQUdFX0hBU19QUklWQVRFLCAgICAgICJwYWdlX2hhc19wcml2YXRlIikgICAgICAg
ICAgICAgXAo+ICsgICAgICAgRU1lKFNDQU5fU1RPUkVfRkFJTEVELCAgICAgICAgICAic3RvcmVf
ZmFpbGVkIikKCkknbSBhIGxpdHRsZSBiaXQgcmVsdWN0YW50IHRvIG1ha2UgdGhlIGVycm9yIGNv
ZGUgbGlzdCBsb25nZXIsIGNhbiB3ZQpqdXN0IHJldHVybiBTQ0FOX0ZBSUw/IElJVUMgdGhpcyBp
c3N1ZSBzaG91bGQgaGFwcGVuIHZlcnkgcmFyZWx5LAptYXliZSBub3Qgd29ydGggYSBuZXcgZXJy
b3IgY29kZS4KCkJhc2ljYWxseSB0aGUgcm9sbGJhY2sgYXBwcm9hY2ggbWFrZXMgc2Vuc2UgdG8g
bWUuIElJUkMgWmFjaCB3YXMKbG9va2luZyBpbnRvIHRoZSBzYW1lIHByb2JsZW0sIGxvb3AgaGlt
IGluLiBIZSBtYXkgc2hhcmUgc29tZQp0aG91Z2h0cy4KCj4KPiAgI3VuZGVmIEVNCj4gICN1bmRl
ZiBFTWUKPiBfCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
