Return-Path: <SRS0=tsT7=6J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382D7C54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 13:15:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED27C2071C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 13:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odm/0TvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED27C2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5F77864D0;
	Sat, 25 Apr 2020 13:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddHfvluJcxtL; Sat, 25 Apr 2020 13:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0F7E863D9;
	Sat, 25 Apr 2020 13:15:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8639BC1AE8;
	Sat, 25 Apr 2020 13:15:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA455C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B35B02050A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O75wnjtToYXn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:15:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A072A204ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:15:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n16so6021948pgb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2X5y9/W+WPCBUZfu2rBLDQK9YX3LEDIetIsu0q5BQLs=;
 b=Odm/0TvFAqAcZq1ZgfDNwlZOk0eA9Yy1KTBCPD7snA7sOgAtLwrpxDaDWSlE90DZPs
 SHcxmdFrrpCAwkVY46igg4elfUST2H2998qr7dKkzRM2Yw4kgU6RB8Qg5cUyP8Kk2Nln
 1OjzmsdIGG+Nyi0egCm3ag6q0KYubTgzCYlZmrmyETK69pqr8k6e3b2NSrh2mNA1BmcA
 sJ4FybgsrvIc0xeAfO5BOLgX9QdfyVrfI5hhNI6wT7zvArUiogMZBMBEq0CUmcpGSgJ8
 RAVzCeFdoH/YaDAzUbL7DsjTcJsdROgfLYEhTUiwaXEnlgKUbBbxdairhY7GECrzRSxf
 d6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2X5y9/W+WPCBUZfu2rBLDQK9YX3LEDIetIsu0q5BQLs=;
 b=pe1KEkLkiQPDZBBhRyuUF+NORYbZAHEX33WdauDEjqqbnrTrAWpymZ8Ou0sPrEqxG3
 sVD33BME6m0feYZ7xg52c5G80vbQOzecbu4DqvgTazyfrNtreAbAQZHVY8dOSosd4DyW
 dH6DBkozbX3XhHCc4KSB25dlhEoM36nDS2C3b+D2boVSec6F3Vs19akZoZ8jHZzimzP7
 VB/UBtg9josx4O/xdYCmXxSfYzH85os5cnFjVscw+YFW/5abK2stzdVjcB4xjNAqM4YC
 nh4EH3HF/vvfN9G1IV6pfNvb+hgw4iV3PdnZyjygzmqJuxfVw3H6CM6Pw8402i/aaVM9
 1h2g==
X-Gm-Message-State: AGi0PuaS/CYsHIN2pYcS2vtcHLE/9GPLmG9ifzMYERo1qqurk34R9GsE
 k3DN5h6BaNyBpO/X5fF0B1M=
X-Google-Smtp-Source: APiQypJF0v1BfMw0id1xhx6xW6SMQ0KPni9kslYHyTDUxN9VbMnCawv0XDZBkPCwMhC1BQuY3UNDgQ==
X-Received: by 2002:aa7:9724:: with SMTP id k4mr14922303pfg.309.1587820550962; 
 Sat, 25 Apr 2020 06:15:50 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.144])
 by smtp.gmail.com with ESMTPSA id c3sm8103900pfa.160.2020.04.25.06.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 06:15:50 -0700 (PDT)
Message-ID: <081e4dc524343830ad7653473e54d86081db807b.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 25 Apr 2020 18:45:40 +0530
In-Reply-To: <490913cf-2563-25a5-c977-dadc87da866b@web.de>
References: <490913cf-2563-25a5-c977-dadc87da866b@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [RFC PATCH 00/25] cocci: Improve
	C parsing of attributes
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

T24gRnJpLCAyMDIwLTA0LTI0IGF0IDE0OjAyICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gaW1wcm92ZSBwYXJzaW5nIG9mIGF0dHJpYnV0
ZXMgaW4gQyBieQo+ID4gQ29jY2luZWxsZSdzIEMgcGFyc2VyLgo+IAo+IEhvdyBkbyB5b3UgdGhp
bmsgYWJvdXQgdG8gdXNlIHRoZSB3b3JkaW5nIOKAnGluIEMgc291cmNlIGNvZGUgYnnigJ0/Cj4g
Cj4gCj4gPiBUaGVzZSBwYXJzaW5nIGVycm9ycyB3ZXJlIGRpc2NvdmVyZWQgYnkgcnVubmluZyBh
IGJ1aWxkIG9mCj4gPiBDb2NjaW5lbGxlJ3MKPiAKPiBXb3VsZCB5b3UgbGlrZSB0byBvbWl0IHRo
ZSB3b3JkIOKAnFRoZXNl4oCdPwo+IAoKSGkgTWFya3VzLAoKQ291bGQgeW91IHBsZWFzZSBrZWVw
IHlvdXIgZmVlZGJhY2sgcmVsZXZhbnQgdG8gdGhlIGFjdHVhbCBwYXRjaCBpdHNlbGYKKG9yIHRo
ZSBjb21taXQgbWVzc2FnZXMpPyBNYXliZSBwdWxsIHRoZSBwYXRjaGVzLCBhcHBseSB0aGVtLCBy
dW4gdGhlbQp5b3Vyc2VsZiwgc2VlIGlmIHNvbWV0aGluZyBicmVha3M/IEZlZWRiYWNrIGxpa2Ug
dGhpcyByZWFsbHkgaXNuJ3QKcmVsZXZhbnQsIHVubGVzcyB0aGVzZSBtaW5vciB0eXBvcy9ncmFt
bWFydGljYWwgZXJyb3JzIGNhdXNlIGEgX2xvdF8Kb2YgY29uZnVzaW9uLgoKPiAKPiA+IENvY2Np
bmVsbGUgY3VycmVudGx5IG1hbmFnZXMgYXR0cmlidXRlcyBzaW1pbGFyIHRvIGNvbW1lbnRzLAo+
IAo+IFdpbGwgdGhpcyBhc3BlY3QgdHJpZ2dlciBmdXJ0aGVyIHNvZnR3YXJlIGRldmVsb3BtZW50
IGNvbnNpZGVyYXRpb25zPwo+IAoKSSBkb24ndCBrbm93LgoKPiAKPiA+IHNvIHRvIGV4cGxpY2l0
eSBzdGF0ZSB3aGF0IHRoZSBhdHRyaWJ1dGVzIGFyZSB0byB0aGUgQyBwYXJzZXIsCj4gPiBhIE1B
Q1JPQU5OT1RBVElPTiBoaW50IHdhcyB1c2VkIGluIENvY2NpbmVsbGUncyBzdGFuZGFyZC5oIGZp
bGUuCj4gCj4gSSBmaW5kIHN1Y2ggaW5mb3JtYXRpb24gc3VzcGljaW91cyBhdCBmaXJzdCBnbGFu
Y2UuCj4gQWRkaXRpb25hbCBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uIGZyb20gYW4gdXBkYXRlIHN0
ZXAgbGlrZQo+IOKAnFtSRkMgUEFUQ0ggMTIvMjVdIHBhcnNpbmdfYzogY3BwX3Rva2VuX2M6IElu
dHJvZHVjZSBNQUNST0FOTk9UQVRJT04KPiBoaW504oCdCj4gbWlnaHQgbWFrZSB0aGUgcHJvcG9z
ZWQgZGF0YSBwcm9jZXNzaW5nIGFwcHJvYWNoIG1vcmUgcmVhc29uYWJsZS4KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9jb2NjaS8yMDIwMDQyNDA5MTgwMS4xMzg3MS0xMy1qYXNrYXJhbnNpbmdo
NzY1NDMyMUBnbWFpbC5jb20vCj4gaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvcGlwZXJtYWlsL2Nv
Y2NpLzIwMjAtQXByaWwvMDA3MjE3Lmh0bWwKPiAKPiAKPiA+IFNlcGFyYXRlIHBhdGNoZXMgd2ls
bCBiZSBzZW50IGZvciB0aGUgYWJvdmUuCj4gCj4gSSBhbSBjdXJpb3VzIGhvdyB0aGUgc29mdHdh
cmUgZXZvbHV0aW9uIHdpbGwgYmUgY29udGludWVkIGhlcmUuCj4gCgpHb29kIHRvIGtub3cuCgpD
aGVlcnMsCkphc2thcmFuLgoKPiBSZWdhcmRzLAo+IE1hcmt1cwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2Vy
bmVsLW1lbnRlZXMK
