Return-Path: <SRS0=z9cQ=5C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB3AC10F29
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:26:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 120C420663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBrRHMNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 120C420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AFC8E2262B;
	Tue, 17 Mar 2020 05:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCLJRSgTHkEb; Tue, 17 Mar 2020 05:26:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D15922268;
	Tue, 17 Mar 2020 05:26:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0110AC1D7C;
	Tue, 17 Mar 2020 05:26:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B42C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B90087E43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsLMKI4E7EJv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:26:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2020487E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:26:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x2so10920374pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 22:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gNdDmm7vhorUwmARF+Xk8NDGpFpOZiompP4+GagtC60=;
 b=FBrRHMNV4JW3od0VEbPTXX7Nfbf7Ai20tSB3S5jqDh7jBcRlKrqNhiOVwBmfe9r2R1
 03jAo14NJoSHHkEKxK3YmAbQcygq4DlKNS58GotZGm+MSO9r15DMA4l5azR1IbeQfgvq
 GB5smphVxxi9hQeFSvMATY1eBzrsrvrhYl9wQwPSd3hmOJQVZePH2mgs7sc0UCWHbspM
 P44WH7fCBDTxlrbtXS/35JU6tldUVIGNjau+JDGszajr5yfrcvchUzxYESyS0LPbPmKQ
 g0Rvkg/ChULm9EMej+q23qXuTClEHctCN6SVkypn2hih1a72iNcZ253fX+Wg4RseFZ3b
 pnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gNdDmm7vhorUwmARF+Xk8NDGpFpOZiompP4+GagtC60=;
 b=h3kaMLxm/Ajz/130YCqx5iAKpCkg7qK4yT5PO5KareNXQ6KAin51p5XZO2qWxb63nx
 hb/OXJ8FMOaRbTwv4yzJhWijl4CdxfuSf7MP+uyyeoYJqnhGjPD/eJ7p5MOo5DXkqlz1
 tFkL6GuHESEqis6RB9KUUdgWnx7CeMpG5kTu+Gh6kpPeYMY+Xb617GSSlHFy0ew3DDkM
 iDfC1XCiEXd9SeCtj7SbqRODJagdFjddbWqg3Om1RAVCy2DsSc/+Sjfsxejx6XUzF+na
 miy84wEKweswZ2WoD/rzDYzR5enfToNGEsjAmTnaQQsVxmqNrKkgT7BL8A9nbguVKJh5
 3QWA==
X-Gm-Message-State: ANhLgQ1x43JZRFWzs+GvCwaPZduWOd6/ghtfXeoGo+SLJO/JHbBFrQI3
 TbiWdPLDCoL7/GX69GFYYNY=
X-Google-Smtp-Source: ADFU+vvP+yNEQbGSCzcCnT4050ff3M6YXyFHy1ZsZ4JQyp+dkqN04KQEuzmAiukJ94PdTqHEC5tsUg==
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr3434133pfn.168.1584422766527; 
 Mon, 16 Mar 2020 22:26:06 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1672:6342:3ccf:a5d:a11e:f77e])
 by smtp.gmail.com with ESMTPSA id i2sm1339563pjs.21.2020.03.16.22.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 22:26:05 -0700 (PDT)
Message-ID: <ce189c1a9ac054d498ec9525ce5a8c408b9dbf98.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 17 Mar 2020 10:56:00 +0530
In-Reply-To: <08714c77-6626-ecaf-a73e-ce864fff8de9@web.de>
References: <08714c77-6626-ecaf-a73e-ce864fff8de9@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 05/26] parsing_cocci:
 visitor_ast0: Add cases for ParenType/FunctionType
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

T24gTW9uLCAyMDIwLTAzLTE2IGF0IDIwOjEwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFRoZSBvcmRlciBvZiB0aGUgdGVybXMgaW4gUGFyZW5UeXBlIHJlcXVpcmUgaW1wbGVtZW50
aW5nIGEgc3BlY2lhbAo+ID4gY2FzZSBmb3IgUGFyZW5UeXBlLiBUaGlzIGNhc2UgaGFuZGxlcyBv
bmx5IHRoZSBmb2xsb3dpbmc6Cj4g4oCmCj4gCj4gSXQgc2VlbXMgdGhhdCB0aGlzIGNoYW5nZSBk
ZXNjcmlwdGlvbiB3YXMgcmVwZWF0ZWQgaW4gb3RoZXIgdXBkYXRlCj4gc3RlcHMuCgpXaG9vcHMs
IGR1bWIgbWlzdGFrZS4gMDQgaXMgZm9yIEFTVDAgdmlzaXRvciBhbmQgMDUgZm9yIEFTVCB2aXNp
dG9yLgpXaWxsIHNlbmQgYSB2MiBmb3IgdGhpcy4KCkNoZWVycywKSmFza2FyYW4uCgo+IERvZXMg
dGhpcyBkZXRhaWwgaW5kaWNhdGUgYSBuZWVkIHRvIHJlY29uc2lkZXIgdGhlIHBhdGNoIGdyYW51
bGFyaXR5Pwo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
