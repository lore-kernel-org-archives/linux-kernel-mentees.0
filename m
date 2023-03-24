Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B04C6FD20
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D8304097E;
	Fri, 24 Mar 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8304097E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OIPfQ5hZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzP0AeNEdGCU; Fri, 24 Mar 2023 21:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6819040973;
	Fri, 24 Mar 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6819040973
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35788C0035;
	Fri, 24 Mar 2023 21:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E54FAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA6A84017C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 21:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6A84017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sFFk9gH3O_d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 21:33:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00ADF401E4
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00ADF401E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 21:33:08 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 i192-20020a6287c9000000b0062a43acb7faso1534903pfe.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679693588;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IwqIwv/tqLiASfdNBOtwEIEJYiaaWmQZ93Bhvs67JGQ=;
 b=OIPfQ5hZVDJHUQ1cSW77jctoIXVTpbXLH1is/tZE2O1XfProT+a3dvD8u1FzOEf5ZV
 JFU9CPp78hu4VYiSgoy029WjYqW36ZtPrMWPxAsT7DixBtPhRdWw4vEZjL9sEEzPdjYb
 Bu0ZOw44UuqO9JBpIlpZxPKvSvJAodiHrgTWqhM3fPwckbpT1XIwSjR93eegagK2oQqm
 4ZY1zTnoOATBSmFspDxOhLhOzGTMKg2nzVMkEhGcTZ9E6BSU+SsG7WzyQbkk9TT8G0Df
 sQCm3IeUWa6dZXbmf9R5WEBCbhw7wQaOKReZnC0x1Q/TSW3eGv6+xLk1+NAQ8hTPSH4c
 1hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679693588;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwqIwv/tqLiASfdNBOtwEIEJYiaaWmQZ93Bhvs67JGQ=;
 b=nPdDXVwQG/R2SHgVrh24tqDbLjsL8gHKn1c6mmj0ewt0rtby3eGeTUC1CSitOlMvpJ
 LHZcHsVIrYkhsjXgb98CH0JwV0oXGXYQ9eyCqwGd4bqhFUoPyzITkIl/AjtrXotucAWn
 FswwMdOZZukCcGKiVuNt65dwHhNfnEWk+UJrLpnuzGFUP6QQfHayepN0gqIfWoCUWAZt
 eEp68xgf20UJQd332yJbxp/u0gCaw5EEDRkB+AJYVkJw7nQooih7rgLoigKfbeJfnLaf
 dwzx8EvHqPDrc5L9XFWC2o+7vjWD2SQY7ZRGnxlSh32UZ1nTfPcrDz/6nyLLFvqlkQEb
 hwdw==
X-Gm-Message-State: AAQBX9dnhrKLWdGJ/RAANGeGov+MilD39gsphY3nAeGgONShmBHs/C92
 ldj+u0H2dOOfbnJ/WPGKG+M/99OTx90=
X-Google-Smtp-Source: AKy350aQM1Ru4OKWaay1ah7w1ErMxIg9e8pk6GVoOvCFEK9Q8i70sf+Y+u16TQBCc2MBGtY74ApaJs2UeT0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2385:b0:5aa:310c:e65b with SMTP id
 f5-20020a056a00238500b005aa310ce65bmr2334505pfc.2.1679693588421; Fri, 24 Mar
 2023 14:33:08 -0700 (PDT)
Date: Fri, 24 Mar 2023 14:32:48 -0700
In-Reply-To: <20230322144528.704077-1-ivan.orlov0322@gmail.com>
Mime-Version: 1.0
References: <20230322144528.704077-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <167969290615.2764662.14384745948331970319.b4-ty@google.com>
Subject: Re: [PATCH] selftests: kvm: Add 'malloc' failure check in
 vcpu_save_state
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com,
 shuah@kernel.org, dmatlack@google.com, vannapurve@google.com, 
 Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 22 Mar 2023 18:45:28 +0400, Ivan Orlov wrote:
> There is a 'malloc' call in vcpu_save_state function, which can
> be unsuccessful. This patch will add the malloc failure checking
> to avoid possible null dereference and give more information
> about test fail reasons.
> 
> 

Applied to kvm-x86 selftests, thanks!

[1/1] selftests: kvm: Add 'malloc' failure check in vcpu_save_state
      https://github.com/kvm-x86/linux/commit/735b0e0f2d00

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
