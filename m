Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89326C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 06:15:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C2DA217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 06:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9MK1YR9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C2DA217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E3CAF20430;
	Fri,  7 Feb 2020 06:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2fGHsnrpfW7; Fri,  7 Feb 2020 06:15:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ED0222039E;
	Fri,  7 Feb 2020 06:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D25A6C1D81;
	Fri,  7 Feb 2020 06:15:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88B47C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7402586988
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imv-oTAmI7wf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D744686937
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:15:19 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id g3so561369pgs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 22:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2oIJ/9+Wdznz5JwXSGSH98pjxWJV1VvrSxJKy0S3YZA=;
 b=K9MK1YR94vwyq+YFLhtou5a0aU4Zady1BPa280VaIh+oIJKIX7pFGH3+LewVTRmKit
 Rx6kiJDuFZ9H1tSLtnVIW60Sm1kfyBIew3FarvW+8Wu04aEslakbaAjNXHEX6x8AwUNk
 L08pXZ2VtkiIS3creW794O0cxbaFgKq3sEn/qU62BM4ocpzU4L2uWjaAQpXQtREWLvVx
 HzI+zRBErtYIWfcCnfzuWwefHsQAgE0l4LeOPXoOI8Rcqby4huItRR04YJA/exxDOplG
 eH9lHxEJlP5bBYPy6r/G4XQYOE+qSDPZAZLt6dXqfvKdKgYEIdZINk+G30OY+TKNq8KS
 lIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2oIJ/9+Wdznz5JwXSGSH98pjxWJV1VvrSxJKy0S3YZA=;
 b=qLTxzohvz04cZhQXsSBpgIv5gsIKZbWgL5eOQObTulWIkb5AxX5VcSfrpbUHg0uCpg
 qmOIb9zrda8YlK+vGAgoeCQjumPH/+ANxv3p94ajnuoby99cwfEe9tttIdkg7BXpjhup
 MBBjWTKoATDrU/D9upH17tmmaDSpK8yRnpx8YP5llqPPAGe3sGEt4HbItxOM/lJPmL83
 7+2jSZ2S20bK+A88iIi0MqGjSu3GoCctlz8RHdFBYs12mn29CAxz+BFaq3HuCBeoWLfP
 uZRLtA+/lM6u+D3wVzOOpqU9l27X6dcjjTLBjSWowu0lcGCQ2EM6NYY7EEhNkbnehfhA
 S/0g==
X-Gm-Message-State: APjAAAWk4ixQZKKQdzzRZ/ciLXnrZ9U6IOCtBivY0um6iHAlfc0FwtSU
 MWTN0wMLDvH0OKE0/UC3xns=
X-Google-Smtp-Source: APXvYqw6wzqbvJmMBT+9pQAOugQrUxw/f93fr+EFyAsRCvHZJitoKbnXIGvBCjs+aV7ABGN96erGkQ==
X-Received: by 2002:a65:5c44:: with SMTP id v4mr8165922pgr.340.1581056119264; 
 Thu, 06 Feb 2020 22:15:19 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 v10sm1342660pgk.24.2020.02.06.22.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 22:15:18 -0800 (PST)
Message-ID: <6e7b556fe05500b5c4f0852b5a7b65f9c762f5ad.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 07 Feb 2020 11:45:13 +0530
In-Reply-To: <964378a7-ddd3-a1f8-e567-f3c4392b14a5@web.de>
References: <132f414d-397f-fb9a-ff6e-5360df827147@web.de>
 <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
 <964378a7-ddd3-a1f8-e567-f3c4392b14a5@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [2/2] tests: Add test case to
 match const pointer variants
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

T24gRnJpLCAyMDIwLTAyLTA3IGF0IDA3OjA3ICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFdvdWxkIHRoZSBmb2xsb3dpbmcgYmUgYSBiZXR0ZXIgc3ViamVjdD8KPiAKPiBUaGUgYWx0
ZXJuYXRpdmUgaXMgbmljZXIuCj4gCj4gCj4gV2lsbCBvdGhlciBpbXBsZW1lbnRhdGlvbiBkZXRh
aWxzIGJlY29tZSBhbHNvIG1vcmUgaW50ZXJlc3Rpbmc/Cj4gCj4gVGhlIGluZm9ybWF0aW9uIOKA
nEFsaWduIEMgQVNUIGFuZCBDb2NjaSBBU1TigJ0gd2FzIHByb3ZpZGVkLgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2NvY2NpLzIwMjAwMjA1MTMwMzI3LjY4MTItMi1qYXNrYXJhbnNpbmdoNzY1
NDMyMUBnbWFpbC5jb20vCj4gaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvcGlwZXJtYWlsL2NvY2Np
LzIwMjAtRmVicnVhcnkvMDA2ODQwLmh0bWwKPiAKPiAqIFNob3VsZCB0aGUgcG90ZW50aWFsIGZv
ciBkaWZmZXJlbmNlcyBpbiB0aGVzZSDigJxBU1TigJ0gYmUgY2hlY2tlZCBhbnkKPiBtb3JlPwo+
IAoKQW4gZWZmb3J0IGlzIGFscmVhZHkgYmVpbmcgbWFkZSB0byBkbyB0aGlzIGJ5IG1lIGFuZCBK
dWxpYSA6KQoKPiAqIEhvdyBjYW4gc3VjaCBpdGVtcyBiZSBjb21wYXJlZCBzYWZlbHk/Cj4gCgpO
b3Qgc3VyZSB3aGF0IHlvdSBtZWFuLiBJZiB5b3UgbWVhbiBob3cgdGhlIHR3byBBU1RzIGNhbiBi
ZSBjb21wYXJlZCwKaXQncyBqdXN0IGEgcHJvY2VzcyBvZiBkYXRhIGNvbGxlY3Rpb24gYW5kIGRl
YnVnZ2luZy4KCkNoZWVycywKSmFza2FyYW4uCgo+IAo+IElzIHRoZXJlIGEgbmVlZCB0byBleHRl
bmQgdGhlIHRlc3QgZm9ybWF0Pwo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb2NjaW5lbGxlL2NvY2Np
bmVsbGUvaXNzdWVzLzEzNAo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWls
aW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1r
ZXJuZWwtbWVudGVlcwo=
