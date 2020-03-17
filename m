Return-Path: <SRS0=z9cQ=5C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67371C10F29
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:28:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382C720663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJgnhTds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382C720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 161312010E;
	Tue, 17 Mar 2020 05:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CILL-rrN4pS; Tue, 17 Mar 2020 05:28:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 72F391FD21;
	Tue, 17 Mar 2020 05:28:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58764C1D7C;
	Tue, 17 Mar 2020 05:28:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F475C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D2188830C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiZBjlpANSl7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:28:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 102DA88309
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:28:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id f16so9107920plj.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 22:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=JoKiQKtVkJixm7HOe5ke9PY52BrPYsvdeaFN6yeeBS4=;
 b=cJgnhTdsdLfYVyXW7+H/45+fO9kQTiZqfDUCLXBHVi0fkKQkS1W3JdhD4ky5FRPZG+
 LrG2a1yJLzidJoLh/rdBnDoj+AyfZ9Jk+Zd3jzdIp7yD12v31V4e19jdrLLregGvK0wt
 rtcoIYE9oHu5CT/KbN7MVRVXYOG2vwmwsASpNFSAFI3tO9mlVo4JQLzhvYGHGF/Eq+In
 aQh/84BCZTXymPE1TdY2ZFWVZgqyoIzt+2L9312B1cZ5i85ETjfquXhdLhOTSDHMcuZP
 mkxES01o+zMO0AHIoa8JmQhmc5PPcuXYVUKpeDeQ4hQ53AYeOinEe7pApJJBDQ0viGVH
 VWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=JoKiQKtVkJixm7HOe5ke9PY52BrPYsvdeaFN6yeeBS4=;
 b=FKrb1/H27gI6KTm55ix9AlTiok36E8Eal8/PtbsmQuyM6+REgXrjL9Lk0bRHZwXNGE
 1+FqQJVEWWf8sWEfAIc3YvCqwncNzkF05JfRPeYBelaMzP6/0XWGAsF2v6m5TrgIFLS/
 +3UekTHwR/dzCqo3T389Lnh/gBsJFwY0H0Au/XhWh6OVcTXjbkzssW69mqDAKCX598qF
 9I6WaMnR2gBp2XSlk8p97UgvrSizyezF/OvmTlLQ57R3h8Oj1EAqvZof8EZQylRqb9Ap
 BZ8lmRqs2FtWxfqVp0ggj3EhKx6hf+5oCNuFGVI1++lvWUhJJ3rdkibcpdz/m9F+gfs9
 hGiA==
X-Gm-Message-State: ANhLgQ15eipEabrdHT8wz5L3lHzyWzfswIcBBnOlTlWaQjUSS9Dgn2Wu
 Iu+NcGTJwSOKPNxe+zYokFc=
X-Google-Smtp-Source: ADFU+vtRrfe8BhSkpL40QqrHv+aQAFVgcEoXhmUPkFhgMb55c+yM+lOjMJZUG2XRI0LaPN5aDVH5vw==
X-Received: by 2002:a17:90a:7185:: with SMTP id i5mr3516814pjk.2.1584422918545; 
 Mon, 16 Mar 2020 22:28:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1672:6342:3ccf:a5d:a11e:f77e])
 by smtp.gmail.com with ESMTPSA id r29sm1105651pgm.17.2020.03.16.22.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 22:28:38 -0700 (PDT)
Message-ID: <3a335c7aef78ea5762248484a645eb5ff27b973c.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 17 Mar 2020 10:58:32 +0530
In-Reply-To: <4d55d76c-29d1-1c88-d8ad-606e32a938d9@web.de>
References: <4d55d76c-29d1-1c88-d8ad-606e32a938d9@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 06/26] parsing_cocci:
 arity: Add cases for ParenType/FunctionType
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

T24gTW9uLCAyMDIwLTAzLTE2IGF0IDIwOjIwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFBhcmVuVHlwZSBhbmQgRnVuY3Rpb25UeXBlIGFyZSBhZGRlZCB0byB0aGUgU21QTCBBU1Rz
Lgo+ID4gQWRkIGNhc2VzIGZvciB0aGVzZSB0eXBlcyBpbiDigKYubWwuCj4gCj4gQSBjaGFuZ2Ug
ZGVzY3JpcHRpb24gdGVtcGxhdGUgd2FzIHVzZWQgc2V2ZXJhbCB0aW1lcy4KPiBJIHdvbmRlciBp
ZiB0aGVyZSBpcyByZWFsbHkgYSBuZWVkIHRvIG1vZGlmeSBvbmx5IGEgc2luZ2xlIE9DYW1sCj4g
c291cmNlIGZpbGUKPiBpbiB0aGVzZSB1cGRhdGUgc3RlcHMuCj4gSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0byBjb21iaW5lIHN1Y2ggY2hhbmdlcyBpbiBhIGJpZ2dlciB1cGRhdGUKPiBzdGVwPwo+
IAoKVGhlc2UgYXJlIHNlcGFyYXRlZCB0aGlzIHdheSBzbyB0aGF0IGl0J3MgZWFzaWVyIGZvciBK
dWxpYSB0byByZXZpZXcuClNoZSB3aWxsIHByb2JhYmx5IGp1c3Qgc3F1YXNoIGFsbCAyNiBvZiB0
aGVzZSB0b2dldGhlciBhbmQgYXBwbHkgdGhlbQpsYXRlci4KCkNoZWVycywKSmFza2FyYW4uCgo+
IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
