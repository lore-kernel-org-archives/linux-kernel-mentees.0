Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811812D0620
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031968; cv=none; b=mhkvK9XP7OvjVAJAwQ6UcetUjsOOSpR/JZm+uPPwNWbUeJhzQ1mkqjqBfZ1sl0Pyif1daBle6BA52ciWaZ35l5GTja2qcUAPDy7Q3fb6/+KGBsY8txKcoetnkfslE67oqoSGE83pcVwafiAA957t3In9vjt19v014CL5dLIrGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031968; c=relaxed/simple;
	bh=G9IZNrwYZ61htAsy9aM1e2VQRFo2Dq9OFnY0wAam0cI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kn/46paoGWuGBDxwTIOWBg5UVL965cpKwq9rAVAu+Xc7I7Ozuhqd8qqZjoQOYHfIryx5/ddfWlP2wj92KpzgEmivgciq1efSaPFYD4nvbjpm5yHJE73ffKhHPwJ7Iiz8wlTL7leBlOuBsUFUuwv1/6DxKpjWu9dWCkznLziGYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0KgCQuL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0KgCQuL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29193400E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O49VPMPDGvEt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99D54400D2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D54400D2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T0KgCQuL
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 99D54400D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:52:46 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24099fade34so43919775ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031966; x=1755636766; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKdqkBsgb8sVcM/PyhPgyMjptZ81BESp0fKKLIlCrE8=;
        b=T0KgCQuLiuD+/crW9PDj8dKIGbZ4jhXdb3ooFCepifhJTlsxqjXy8JE4oX7a3Boosf
         tLfB53Nlf9WenyPoQa9fxS/HyOe/GKpYLqwiEub3k0PZfHhWm3DP+qTMXeai8qV4I17r
         0w1JwfiKNgi/a8A7hjhGV+gdNMIG5oA29vZrgUlNCTXniI4MqrOuaAyIg3gHyOeHbYZ0
         x89dqfEtpyETOu0Igw+b+7KXmO0zDEnntROGnnyd+uE4Ig/t8QYA6GSiP+SLKzVXr7iU
         dayu63Qi7Hx5rfFvT5Wx0aAkw+DnoY0bwnimUaBaWV2mxXJXYwbsDIiPmqNEwk17OO0U
         3d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031966; x=1755636766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKdqkBsgb8sVcM/PyhPgyMjptZ81BESp0fKKLIlCrE8=;
        b=qovVh06Zg4eDbebAf7A/hT++oXjlNWRh53lHGnFeXr3fYn5zm7/1T8iAjCnb7bb7d7
         JdPcA6AifYcetQM/JH/goWDG7a2nXb+q8L60GVbzbi8xu9PaTAJ7WJge3G3h/r1BZqdn
         BBQRXPt4SSLpFykBWlwZOWDAZOui0Y5EmiParESNKnrelLyEynAO0OP86ueCX6qtNXr+
         xB5ZCyo9EbOSGKWv3TFWelcg5BGmuMqoYQhCOHkqqgZJvCAg9QqnSWdDmgiF25g5Db23
         EQpclRPgR3Ww1CW6R2sP4gVpm0bkrMFXjg2q9VJTkQi0qUSmsikG8gj4N5NO6MQ49miM
         YUeQ==
X-Gm-Message-State: AOJu0YySAkVeZinvx1e6/ekc+9JVR9X5+TrC6ufud/Pyj8Q4Dz2R5afN
	MlG2mer+gdFwKIxqJNQcRJZTIT9AKer8xjG2edvWFiJLxXhboKtMn2xN
X-Gm-Gg: ASbGnculRupf6q+olH2udquQ1NxZTIt7/D9MVmYF0Rr4t+hVTxnfY22kIIBcJF3Pqhe
	j9X4bQyeCHdfdlztjNACBj5jDezRvMynVEuNiv7kGpCWNn89FFY0nls+4v9Zp43tWXQnk+C2h0n
	pXaT6um4VCpSjcCZQrYh33zL9RxARZcmfTewy8ZzlMKZnNlsXLoE5Yqcn9Lk2g1Ln1Qgq8T6JmR
	07bsT4dxErhg/YKuWblZzxIhRCBxByc9bCr9m5D64HuAP8sOUS3tCjj4WHDpG2yFHM3sjEaHjIy
	NYJq3edDxAKXcZUBCSxjkZJ6LccZHgG31BYxbvxd0shXTjorimvZ+Iv0h3vZuhmTdbFE4d7kHTn
	ZDafAR/QDroDotW0DGIwrn107Nyj6GT4=
X-Google-Smtp-Source: AGHT+IFgFMX1RhujMsG9we6nXKVttkMfV8WFbd5L9WXgoutdEQl5tNFIRuuQJ04bmfjMzKiUh76UjQ==
X-Received: by 2002:a17:902:f70e:b0:240:2774:8372 with SMTP id d9443c01a7336-2430d1f86c9mr8512545ad.36.1755031965598;
        Tue, 12 Aug 2025 13:52:45 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:52:45 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 5/9] docs: alienware-wmi: fixed spelling mistake in admin guide
Date: Wed, 13 Aug 2025 02:19:48 +0530
Message-Id: <20250812204952.73136-3-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- aproximate -> approximate

in `Documentation/admin-guide/laptops/alienware-wmi.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
 
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` value
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
 
 ::
 
-- 
2.34.1

