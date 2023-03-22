Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9A0C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Mar 2023 14:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E007C41D5F;
	Wed, 22 Mar 2023 14:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E007C41D5F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SfTs+c81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IO0CCsft8V9; Wed, 22 Mar 2023 14:45:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BE14141B83;
	Wed, 22 Mar 2023 14:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE14141B83
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80AC5C0071;
	Wed, 22 Mar 2023 14:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 893B7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 14:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 519CF417C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 14:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 519CF417C3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SfTs+c81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGqudu3N4uCW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 14:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 835DC417BA
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 835DC417BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 14:45:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ew6so10990947edb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679496334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rLmkUGsjVKN4NZf9Xwc68SFWMoDmXlx37mUEv+QwNDs=;
 b=SfTs+c817QkFkmtH//ktryjgBJ3/o2Pj5C9ikp9Le++n2Ykm9Y5EQNgikfOy8eUjk9
 RkSFSmqvIbvwxyEie+7wkWesrZg/vRENcgAklTF3n98xNsY07sQyR8LLMBnxMZyiLRrk
 53zYL8EhW/C8FTySSs/JgyJk187s/eaRaxeBy3l0LeHqqHarwNFe5omlsia5W+B4H0Kv
 P9BvilEYSsxjzbzibSNR/y0ejfGnV084SY8SSHCvRPTaztrKC7w8IvXDl5Zohvv/+ari
 eekCiWFQqOjDlaww9HEm44n/ifgcTrcSPT0qczEeXFtRD3am2bdWiCQfX0dPy1QdzMd0
 CGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679496334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rLmkUGsjVKN4NZf9Xwc68SFWMoDmXlx37mUEv+QwNDs=;
 b=isPlrU3p0oWFDVXO4jO2krOn4bWopBi8duMq7EKT86OUzPFUz7gjoW5S5QWRkhD2FH
 ONt6c6iUkRIXNtgB5dCSIxQMZEl8VAitL+Wx64OdMr9Bt7PVaxyZe37q6dZwyx5ARIOm
 oLQ2He48Yr1RvFViEELwei9SK9XgY8udneR7HUSK0l1wqHgdcobQhKVKTaC8EHFb9MeH
 ujSlGRpk+yKDbxDRBC0YaByO9EO8M/K04vnpnz0YCooDytTkhnkmnyB8ZYc8j8cUtFPa
 caVDV8tZ/kCymwI8r6YfaFgyG5SYtOksi52+zjCIVRzrErQoYsKtna2hLKRUaH40fK3W
 h9Dw==
X-Gm-Message-State: AO0yUKW8huVy+SSO08EGFB8UEFx2tY3J0DKS+a8h3uotHJi6xONBjVvD
 QAOrcbi79XrZHo3tJKCBnyA=
X-Google-Smtp-Source: AK7set/eNEzNh4JcOxymfhGwBqM5daoKmgX/0uSzD/XkdVZ0pb4jAN1GI3sQMn0JGiwqY3Zd5TaEyA==
X-Received: by 2002:a17:906:209:b0:932:170:e07b with SMTP id
 9-20020a170906020900b009320170e07bmr5657820ejd.7.1679496334548; 
 Wed, 22 Mar 2023 07:45:34 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a17090674da00b009310d4dece9sm7298268ejl.62.2023.03.22.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:45:34 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: pbonzini@redhat.com, shuah@kernel.org, seanjc@google.com,
 dmatlack@google.com, vannapurve@google.com
Subject: [PATCH] selftests: kvm: Add 'malloc' failure check in vcpu_save_state
Date: Wed, 22 Mar 2023 18:45:28 +0400
Message-Id: <20230322144528.704077-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There is a 'malloc' call in vcpu_save_state function, which can
be unsuccessful. This patch will add the malloc failure checking
to avoid possible null dereference and give more information
about test fail reasons.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index c39a4353ba19..827647ff3d41 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -954,6 +954,7 @@ struct kvm_x86_state *vcpu_save_state(struct kvm_vcpu *vcpu)
 	vcpu_run_complete_io(vcpu);
 
 	state = malloc(sizeof(*state) + msr_list->nmsrs * sizeof(state->msrs.entries[0]));
+	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
 
 	vcpu_events_get(vcpu, &state->events);
 	vcpu_mp_state_get(vcpu, &state->mp_state);
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
