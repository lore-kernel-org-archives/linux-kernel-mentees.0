Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FAKE_REPLY_A1,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DC6C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 09:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01EE60462
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 09:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E01EE60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2175606F2;
	Wed, 18 Aug 2021 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BMkOVbsI80m; Wed, 18 Aug 2021 09:35:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA60605F6;
	Wed, 18 Aug 2021 09:35:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4363CC001A;
	Wed, 18 Aug 2021 09:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B843CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 09:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A385B401B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 09:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM4cRysHSGmK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 09:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D564015C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 09:35:44 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so4916825pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KiAVkJm8yedWuSRYoNSKYqF2ar+US6oMlUNo9BAqWgc=;
 b=FIXmYUjGSX3o1YVWouA1Y7gfSaD1UG8iTlsfjIqqO6MKxNH8bO83rFEZ1OZIEloJAP
 cJH9e8lLAHRxfxMEsmBZaeAP6aO+A657cxqg7r5L59xjwNApnt9XE4gXAzvZ9rCOL0fO
 dM3dWx3rgqPBjqfxNWCffmrsoLXealD4cwRqp4QO6fmbE7USwV69W6Ca8vYx/KJm4mCF
 LgD24hspIuc2mXzo8G+LiUVHRrmH8jppa9ulxjtfIRiquiCNn/crlbtd0Igj5f3Hi4qB
 OEna/6WUXQYLg6ok/hMakEQS6xVT+6/UdhEjBSxzXN0SMIZqdmIYXM2vRgrzLCmWSy9i
 WevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=KiAVkJm8yedWuSRYoNSKYqF2ar+US6oMlUNo9BAqWgc=;
 b=lRUqSbH806qdY5ZeX8DH44FMV59i+kvz4fRTy65LHMI6+VlXOPoMEkAfHK34uHAOOr
 m1eBeghgdGEQY4DeiROXwzERGd50+IAdvaDjNXPl9KTs7nf2kq+Pjd9IlkyGbJ8cQ75u
 ZthCrAXDHWWLRIYJkvpd09AG4PucqSEc53C9T5WKIBRnLCt237NcUKtIkOwO8e0aPiER
 nYStE5Cx5cJa8L8uMLwQwIAlbnEkmF5tarOgyE2VvPqRXm027QABWJxZAjSo9MIfMQ3h
 XXibC7oyHwHsHtAvSswceG3VzuTNU2XxVchEgh3Pmjredxwqau5S4hn9cjz2pQ1HEeVE
 M3kQ==
X-Gm-Message-State: AOAM530LqEQEhIbUyBYC91fwRrTLGsOf4O/xLGafl3R3cD+cS7CRklCG
 b/nBIJfHdXZL35d3iqDVFSzypdThL5SK2XAJ
X-Google-Smtp-Source: ABdhPJwMVbYhpp1VxDZastMUJBFk1h1kv8wSXCuOlVTN6w9KCKxPYav5BlHbm5lCnfeCswV/Bt7IRg==
X-Received: by 2002:a17:90a:c7cc:: with SMTP id
 gf12mr8354445pjb.152.1629279343645; 
 Wed, 18 Aug 2021 02:35:43 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u16sm6563484pgh.53.2021.08.18.02.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 02:35:43 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: syzbot+1aec08e752387f55c449@syzkaller.appspotmail.com
Subject: Re: general protection fault in drm_atomic_set_crtc_for_connector
Message-ID: <e1375344-82aa-1a38-e51a-2989c4ee7858@gmail.com>
Date: Wed, 18 Aug 2021 17:35:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: syzkaller-bugs@googlegroups.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

#syz fix: drm: fix oops in drm_atomic_set_crtc_for_connector

At the time of the bug report [1], there was the following call in 
update_output_state:
> 			ret = drm_atomic_set_crtc_for_connector(new_conn_state,
> 								NULL);

This was followed by
> 	if (crtc) {
> 		crtc_state = drm_atomic_get_crtc_state(conn_state->state, crtc);
> 		if (IS_ERR(crtc_state))
> 			return PTR_ERR(crtc_state);
> 
> 		crtc_state->connector_mask |=
> 			drm_connector_mask(conn_state->connector);
> 
> 		drm_connector_get(conn_state->connector);
> 		conn_state->crtc = crtc;
> 
> 		drm_dbg_atomic(crtc->dev,
> 			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
> 			       connector->base.id, connector->name,
> 			       conn_state, crtc->base.id, crtc->name);
> 	} else {
> 		drm_dbg_atomic(crtc->dev,
> 			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
> 			       connector->base.id, connector->name,
> 			       conn_state);
> 	}

in drm_atomic_set_crtc_for_connector, which clearly dereferences a null 
pointer in the else block. This led to the reported general protection 
fault.

commit 0003b687ee6d("drm: fix oops in 
drm_atomic_set_crtc_for_connector") fixes this by getting the device 
from connector, which can't be NULL.

Link: 
https://syzkaller.appspot.com/bug?id=768a24e51bd111e0c1d6b6f4e1f09fac3c54c05d 
[1]

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
