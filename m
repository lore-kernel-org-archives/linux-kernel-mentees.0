Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCF5C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:32:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B167613B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B167613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20F6405D9;
	Tue, 27 Apr 2021 20:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZXCLO5HfxRu; Tue, 27 Apr 2021 20:32:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE653404CC;
	Tue, 27 Apr 2021 20:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE679C001C;
	Tue, 27 Apr 2021 20:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C0A1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B2EC40599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEpcUmREbJyQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:32:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFEA1404CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:32:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id o5so36617287ljc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 13:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPV8KzD4Id7fO8Ex+2dMRwWfRxbvKPR4uEdbJrm/80s=;
 b=WQ2mGzScEBypXLbBKg2h71WNtB9nX0hYPKLpF5JJPobZ44UiotRYVflDB2voLRHtEf
 feJ3xQK2w9ZTU1QEst0bV3bH8iW3R7O4uGFR5MKCww3B2fBs1Qb3gcJZ9Ez9/kEH0MNT
 e7vssvcySyilsWi0L1H3YvIkchXuC6l7VuCZ0U3Xr0o6CaS8yoGK0jyzaqkQlFTIrLt6
 AuX/0y+hLo9OawYNvTS4npqqGHETJNp5qpyWe5K5BiJdqdcGbuFK376Vf7JpcFh54Kc6
 96V5wnXW+/+QO48/zku0tiZt1kIAnCU+BVmUpXKIaJI+8S53T1bOr3doCS+rel9Mo7Rt
 0JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPV8KzD4Id7fO8Ex+2dMRwWfRxbvKPR4uEdbJrm/80s=;
 b=Z4t9i96fP/z3hLnr1NcwAMMIS+lpzEpK3NbxgUVVuj3k6czmKnOrDghJMuvjT+cIvN
 JK4+oA6XN0BQcFlA+hCaPMTgClBDNgXiEHIXtfDnvVFo4YI3m171X4Haauh/crLwcmDV
 h87xc9cB6KisDXLhUDAFyN+hPThg3OyIfiGZtDHmIj+T8BAKxhcL7ekfz+NcLZ7LDkG1
 2kjMe3ZTo5DH7ReaYkiwU6L8iIW1AVUsITwGoJ+IpxdHqVIzQ4tktLRmjI3Qu+Rxz+SW
 YEnpevx++U6dinUIjuW2eh+k+IdjpqMIq8t7mxbdTBcsW/eyOEV2xWhoixAmdGnaA73r
 4+GA==
X-Gm-Message-State: AOAM532sAdScdEdJSYElmXxPdnNNluPwLHWioZQWscxAn99tFc1q+PQ4
 nYnIS1R/O82nOGrTyi+GoT8=
X-Google-Smtp-Source: ABdhPJzlnWg2aN0Ty4wspe9+UY+WC1+2Chwr/dGECElPQbRLvbOxyuLSbEcInQ2dZ+FqyEdXEXDCDw==
X-Received: by 2002:a05:651c:105c:: with SMTP id
 x28mr18805943ljm.474.1619555524697; 
 Tue, 27 Apr 2021 13:32:04 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
 by smtp.gmail.com with ESMTPSA id j17sm195882lfm.263.2021.04.27.13.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 13:32:04 -0700 (PDT)
Date: Tue, 27 Apr 2021 23:32:02 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Esme Xuan Lim <esmethedev@gmail.com>
Subject: Re: kernel-debugging discord channel
Message-ID: <20210427233202.32ceea03@gmail.com>
In-Reply-To: <SL2PR01MB258670B9EECCC0B85DF52D88A1419@SL2PR01MB2586.apcprd01.prod.exchangelabs.com>
References: <CACT4Y+YC0SRFC=AEzj7cte7zCL_X1U941T25Yia5hpncrJxTcg@mail.gmail.com>
 <SL2PR01MB258670B9EECCC0B85DF52D88A1419@SL2PR01MB2586.apcprd01.prod.exchangelabs.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: Vegard Nossum <vegard.nossum@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Dmitry Vyukov <dvyukov@google.com>
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

SGkhCgpPbiBUdWUsIDI3IEFwciAyMDIxIDIwOjMwOjQ2ICswMDAwCkVzbWUgWHVhbiBMaW0gPGVz
bWV0aGVkZXZAZ21haWwuY29tPiB3cm90ZToKPiBIaSBEbWl0cnksCj4gCj4gVGhhbmtzIGZvciBz
ZXR0aW5nIHRoaXMgdXAhCj4gCj4gVGhlIGxpbmsgZG9lc27igJl0IHNlZW0gdG8gYmUgd29ya2lu
ZyB0aG91Z2ggOiggSSB0aGluayB3ZSBtaWdodCBuZWVkCj4gYW4gaW52aXRlIGxpbmsgbm90IGEg
Y2hhbm5lbCBsaW5rCj4gCgpodHRwczovL2Rpc2NvcmQuY29tL2ludml0ZS93d0dQYUFVdGttCgpG
b3VuZCBvbiB0d2l0dGVyIDopCgpXaXRoIHJlZ2FyZHMsClBhdmVsIFNrcmlwa2luCgoKPiBUaGFu
a3MKPiBFc21lCj4gCj4gR2V0IE91dGxvb2sgZm9yIGlPUzxodHRwczovL2FrYS5tcy9vMHVrZWY+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcm9tOiBMaW51eC1rZXJuZWwt
bWVudGVlcwo+IDxsaW51eC1rZXJuZWwtbWVudGVlcy1ib3VuY2VzQGxpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmc+IG9uIGJlaGFsZiBvZgo+IERtaXRyeSBWeXVrb3YgdmlhIExpbnV4LWtlcm5lbC1t
ZW50ZWVzCj4gPGxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmc+
IFNlbnQ6IFdlZG5lc2RheSwKPiBBcHJpbCAyOCwgMjAyMSA0OjE5OjU3IEFNIFRvOiBzeXprYWxs
ZXIgPHN5emthbGxlckBnb29nbGVncm91cHMuY29tPjsKPiBsaW51eC1rZXJuZWwtbWVudGVlc0Bs
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnCj4gPGxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmc+IENjOiBWZWdhcmQgTm9zc3VtCj4gPHZlZ2FyZC5ub3NzdW1AZ21h
aWwuY29tPiBTdWJqZWN0OiBrZXJuZWwtZGVidWdnaW5nIGRpc2NvcmQgY2hhbm5lbAo+IAo+IEZZ
SSwgVmVnYXJkIGNyZWF0ZWQgYSBrZXJuZWwtZGVidWdnaW5nIGRpc2NvcmQgY2hhbm5lbCwgZGVk
aWNhdGVkIGluCj4gcGFydGljdWxhciB0byBkZWJ1Z2dpbmcvZml4aW5nIG9mIHN5emJvdCBidWdz
Ogo+IGh0dHBzOi8vZGlzY29yZC5jb20vY2hhbm5lbHMvODM1OTE1NzU2NjYyOTQ3ODcwLzgzNjEw
Nzc4NDI1MjY4NjM1Ngo+IEl0IGV2ZW4gaGFzIHN5emJvdC1mZWVkIHdpdGggbm90aWNhdGlvbnMg
YWJvdXQgbmV3IHN5emJvdCBidWdzIQo+IGh0dHBzOi8vdHdpdHRlci5jb20vdmVnYXJkX25vL3N0
YXR1cy8xMzg2Mzc0Mzc4MzY0MDE0NTk5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKPiBM
aW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCj4gaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1l
bnRlZXMKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
