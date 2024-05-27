Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AFB13B2B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716805830; cv=none; b=bFRZZWAKCh68vIdLDlf9IKKSlYpWIN+7OLpstkfW4GieuFf2IxUCl0ky+h+Kfp8dhGH8iEcKBptcojotQvlhSlk0HDttEWM6bcfiJfPssueBYIQ3mwtlrHcIzMuauJjeVRZUDi7p1g0DO2oJomQ5e0KLyhWRA/ReM8qNSvvYjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716805830; c=relaxed/simple;
	bh=Wq8c0gvjGwwSH+T9v3NISONmcgDc06858d/bCXTl+OI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kdR2ZIKQBchz4sLzDjGWE53j73Yl2PofRggw562n0UH6jv0mgDkErxEIepGtXt/gsghIiyMHvPeZfDVkqnZxaD4NWi2/FI0BKBggyS6Hozvxp2bs0Wa55W6Fhe0Qjx4xKBAMt9eWxr6M/s72qm4qta/l3H13wUIYpvITBY6L2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw5X4WW8; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw5X4WW8"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F90404B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 10:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRxG0hMB1Sox for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 10:30:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D07C7400AB
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07C7400AB
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sw5X4WW8
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D07C7400AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 10:30:27 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-24cbb2b71b4so1253250fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716805826; x=1717410626; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNrP81aLFZY/yKeyxhffe6d/lACVAXrZvHzkDRJWq/M=;
        b=Sw5X4WW85gx2hS+qmx71M42n1VaApFz8s1QOnaPUNClAZY01TA2XVKE7DZL8lH1ff7
         EivehB3WCkGJTTwa//FnK7yiAR5A8JRAFgUE5ne/1fPtj3jkitz80Kaf1mGvhiifHTOl
         2qXVB72Y9NKZshocM9zOGq33EeUEsZedc0m2vX+TZLkAjC0gdoXEtwaZ/R6gdHUKLDt+
         bPA/4ITcmvybW3VbHmxGC/SL2oVyQSLcynZJl3LC96weqCggY5oHyk18Jk8z4f+CSqHM
         6rIOLTrnN+lTj7vrQJCPU8iveTB9Q5ldTq6dUOtouxGotG5tyF8FmfGEgJ1PZk3oivgM
         E5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716805826; x=1717410626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNrP81aLFZY/yKeyxhffe6d/lACVAXrZvHzkDRJWq/M=;
        b=Rl/DHJijxv/EMGGRgWb70Gg1UeH8zrPUQWwQwh5gRwYko8YV49HdXHb/a2ztX1/1kH
         PsSfOmFQDAaiMll6lC6XlfsMpuvxp5AdHyL6EZavf2LIYibTxKvgfecA4nMGxy5WtGUf
         xeDx+vQXVdBSF8ugNV5L3nbNPEylQ4HJcpzQ5rWH85AsfnqLoKEXWBqurzxsFVCxWOXm
         lmQJhtze8gBx1mU/5fH5I291KF5pS4EWxFRpGKWN9AEv617jw7yWIu2/hz1YUrZEwOoH
         /WdFzll4gWmCLMkDk5I6STABAV50wUaxhPpGLU1llJ2g0q1wLwY5W0CxN+u2AE51ZbbM
         Dh9A==
X-Forwarded-Encrypted: i=1; AJvYcCUPgVj4JC1PqbXUX/foEvVWVkiHeBNqy9Ute264hqsZk/GSxU1AZ93TwrYdaRVYAayBR95Tl98HLc9ZEwstfPz+TOPflT8xopHZ5GhI4rlJthKNd7yck/9AVs0OE6q0
X-Gm-Message-State: AOJu0YygsVrJ6Aso5WKi6PPtA338EVs714uZwZ5pnu8kdyvgqDHHWVtj
	53QQPcLaS98At8VbjlMVJo59c2CcFD1dBWuGeV2i82wU95XFhYVkERK75TlAdNA=
X-Google-Smtp-Source: AGHT+IES0E2ywnPldmjeCTxfJ7NVU+l9hbdvDhAfceWO0tztB1xokVuOqYjcZto73JekUsR/4tOuQg==
X-Received: by 2002:a05:6870:55c6:b0:24f:cf39:9684 with SMTP id 586e51a60fabf-24fcf39bc56mr5814339fac.3.1716805825462;
        Mon, 27 May 2024 03:30:25 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4da8f6sm4640815b3a.210.2024.05.27.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:30:25 -0700 (PDT)
From: yskelg@gmail.com
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org,
	Jinwoo Park <pmnxis@gmail.com>,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH v3] Documentation: cve Korean translation
Date: Mon, 27 May 2024 19:30:04 +0900
Message-Id: <20240527103003.29318-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

This is a Documentation/process/cve korean version.

Reviewed-by: Jinwoo Park <pmnxis@gmail.com>
Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 .../translations/ko_KR/process/cve.rst        | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/translations/ko_KR/process/cve.rst

diff --git a/Documentation/translations/ko_KR/process/cve.rst b/Documentation/translations/ko_KR/process/cve.rst
new file mode 100644
index 000000000000..9daacba8d445
--- /dev/null
+++ b/Documentation/translations/ko_KR/process/cve.rst
@@ -0,0 +1,108 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:원문: Documentation/process/cve.rst
+:역자: 김윤성 <yskelg@gmail.com>
+:감수: 박진우 <pmnxis@gmail.com>
+
+==========
+CVE 항목들
+==========
+
+공통 취약점 및 노출(CVE®) 번호는 공개적으로 발표된 보안 취약점을 식별, 정의 및
+목록화하기 위한 명확한 방법으로 개발되었습니다. 시간이 지남에 따라 커널
+프로젝트와 관련하여서는 그 유용성이 감소했으며, CVE 번호는 부적절한 방식과
+부적절한 이유로 할당되는 경우가 매우 많았습니다. 이로 인하여 커널 개발
+커뮤니티에서는 이를 기피하는 경향이 있었습니다. 그러나 커널 커뮤니티 외부의
+개인과 회사가 CVE 및 기타 형태의 보안 식별자를 할당하라는 지속적인 압박과
+지속적인 남용이 결합되면서 커널 커뮤니티가 이러한 할당에 대한 통제권을 가져야
+한다는 것이 분명해졌습니다.
+
+Linux 커널 개발자 팀은 잠재적인 Linux 커널 보안 문제에 대해 CVE를 할당할 수
+있는 권한이 있습니다. 여기서 할당은 :doc:`일반 Linux 커널 보안 버그 보고
+절차<../process/security-bugs>`와는 별개입니다.
+
+Linux 커널에 할당된 모든 CVE 목록은
+https://lore.kernel.org/linux-cve-announce/ 에 있는 Linux-CVE 메일링 리스트의
+아카이브에서 확인할 수 있습니다. 할당된 CVE에 대한 알림을 받으려면 다음의
+메일링 리스트를 `구독
+<https://subspace.kernel.org/subscribing.html>`_ 하세요.
+
+절차
+====
+
+일반적인 안정 릴리스 절차의 일부로, 잠재적으로 보안 문제가 될 수 있는 커널
+변경 사항은 CVE 번호 할당을 담당하는 개발자가 식별하여 CVE 번호를 자동으로
+할당합니다. 이러한 할당은 linux-cve-announce 메일링 리스트에 공지사항으로
+수시로 게시됩니다.
+
+리눅스 커널이 시스템에 있는 계층으로 인해 거의 모든 버그가 커널의 보안을
+손상시키는 데 악용될 수 있지만 버그가 수정되면 악용 가능성이 명확하게 드러나지
+않는 경우가 많습니다. 이 때문에 CVE 할당 팀은 지나치게 조심스럽게 버그 수정이
+확인되는 모든 버그에 CVE 번호를 할당합니다.
+이것이 리눅스 커널 팀에서 발행하는 겉으로 보기에 많은 수의 CVE를 설명합니다.
+
+사용자가 CVE를 지정해야 한다고 생각하는 특정 수정 사항을 CVE 할당 팀이 놓친
+경우에는 <cve@kernel.org>로 이메일을 보내 주시면 커널 CVE 할당 팀에서 함께
+작업할 것입니다. 이 별칭은 이미 릴리스된 커널 트리에 있는 수정 사항에 대한
+CVE 할당 전용이므로 잠재적인 보안 문제는 이 별칭으로 보내서는 안 됩니다.
+수정되지 않은 보안 문제를 발견했다고 생각되면 :doc:`일반 Linux 커널 보안
+버그 보고 절차<../process/security-bugs>`를 따르세요.
+
+Linux 커널에서 수정되지 않은 보안 이슈에 대해서는 CVE가 자동으로 할당되지
+않으며, 수정이 제공되고 안정적인 커널 트리에 적용된 후에만 자동으로 할당되며,
+기존 수정의 git 커밋 ID로 추적할 수 있습니다. 커밋으로 문제가 해결되기 전에
+CVE를 할당받고자 하는 사람은 커널 CVE 할당 팀<cve@kernel.org>에 문의하여
+예약된 식별자 항목들에서 식별자를 할당받으시기 바랍니다.
+
+현재 Stable/LTS 커널 팀에서 적극적으로 지원하지 않는 커널 버전에서 발견된
+문제에 대해서는 CVE가 할당되지 않습니다.
+현재 지원되는 커널 브랜치 목록은 https://kernel.org/releases.html 에서 확인할
+수 있습니다.
+
+할당된 CVE 항목들의 분쟁
+=========================
+
+특정 커널 변경에 대해 할당된 CVE에 대해 이의를 제기하거나 수정할 권한은
+전적으로 영향을 받는 관련 하위 시스템의 유지 관리자에게 있습니다.
+이 원칙은 취약점 보고에 있어 높은 수준의 정확성과 책임성을 보장합니다.
+하위 시스템에 대한 깊은 전문 지식과 친밀한 지식을 갖춘 사람만이 보고된
+취약점의 유효성과 범위를 효과적으로 평가하고 적절한 CVE 지정을 결정할 수
+있습니다. 이 지정된 기관 외부에서 CVE를 수정하거나 이의를 제기하려는 시도는
+혼란, 부정확한 보고, 궁극적으로 시스템 손상으로 이어질 수 있습니다.
+
+잘못된 CVE 항목들
+=================
+
+특정 배포판에서 변경된 사항 적용한 배포판은 더 이상 kernel.org 지원 릴리스가
+아닌 커널 버전을 지원합니다. 때문에 Linux 배포판에서만 지원되는 Linux 커널에서
+보안 문제가 발견되는 경우 Linux 커널 CVE 팀에서 CVE를 할당할 수 없습니다.
+변경된 사항을 적용한 특정 Linux 배포판 자체에 요청해야 합니다.
+
+커널 할당 CVE 팀이 아닌 다른 그룹에서 적극적으로 지원되는 커널 버전에 대해
+Linux 커널에 대해 할당된 CVE는 유효한 CVE로 취급해서는 안 됩니다.
+CNA 수정 절차를 통해 특정 배포판에서 적용한 항목을 무효화할 수 있도록
+커널 CVE 할당 팀<cve@kernel.org>으로 알려주시기 바랍니다.
+
+특정 CVE의 적용 가능성
+======================
+
+Linux 커널은 외부 사용자가 다양한 방법으로 접근하거나 전혀 접근하지 않는
+등 다양한 방식으로 사용될 수 있으므로 특정 CVE의 적용 여부는 Linux 사용자가
+결정할 사항이며 CVE 할당 팀의 권한이 아닙니다. 특정 CVE의 적용 가능성을
+판단하기 위해 우리에게 문의하지 마시기 바랍니다.
+
+또한 소스 트리가 매우 방대하고 어떤 시스템도 소스 트리의 작은 하위 집합만
+사용하므로 Linux 사용자는 할당된 많은 수의 CVE가 자신의 시스템과 관련이 없다는
+사실을 알고 인지해야 합니다.
+
+즉, 우리는 사용자의 사용 사례를 알지 못하며 사용자가 커널의 어떤 부분을
+사용하는지 알 수 없으므로 특정 CVE가 사용자의 시스템과 관련이 있는지 판단할 수
+있는 방법이 없습니다.
+
+항상 그렇듯이 커널 변경 사항은 개별적으로 선별된 변경 사항이 아니라 많은
+커뮤니티 구성원이 통합된 전체에서 함께 테스트하는 것이므로 릴리스된 모든 커널
+변경 사항을 적용하는 것이 가장 좋습니다. 또한 많은 버그의 경우 전체 문제에
+대한 해결책은 단일 변경 사항이 아니라 여러 수정 사항을 모아놓고 보아야 찾을 수
+있다는 점에 유의하세요. 이상적으로는 모든 문제에 대한 모든 수정 사항에 CVE가
+할당되지만, 때로는 수정 사항을 발견하지 못하는 경우가 있으므로 CVE가 할당되지
+않은 일부 변경 사항이 관련성이 있을 수 있다고 가정합니다.
-- 
2.34.1

