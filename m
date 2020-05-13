Return-Path: <SRS0=2ll/=63=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEB4C2D0F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 07:30:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7681205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 07:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWRx6W1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7681205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 623B9884FD;
	Wed, 13 May 2020 07:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3C6usn7Gg5Ew; Wed, 13 May 2020 07:30:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED012884A1;
	Wed, 13 May 2020 07:30:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D67A8C088A;
	Wed, 13 May 2020 07:30:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEDC9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 998EF883E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3OORqh-php6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3D44C8836D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n11so7395351pgl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zSfbyX5r9kKigKF1re6aCmb7I64eRlSnc/rXxdxVCoI=;
 b=pWRx6W1li4PaG1lpEBYZvLdYs7ecG2XArFvTx/iud6iIKzQd578GRoEeblfg/dk5MK
 t8YHCNlQEsfvOWCnt44mMtMytDROJ1+3bnS5hNIfBAbCwE6vrwivn3NT4AlF+Ozm4qj4
 1/1uIAYjostQtw5yqaAg6HHUR3++RkVm7ERGkqi+cCROdGKRHHQRb4kQfZ9SPz904wKp
 vo7FhO4XevgsXSYnJPuh+C0yVdL3MY/RQCZGZd3+Gdmx8iTVQGNtnXoPKZMsbT6+3mpo
 X7H+j49ODzVyj5pi6voNlPUoGDPQePIYwq2witNzYQMZPlJUEEBPR92NLOUTF6xEYMLY
 a4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zSfbyX5r9kKigKF1re6aCmb7I64eRlSnc/rXxdxVCoI=;
 b=pbH58+tm0r7jfN2Ru/by8XqiGYXFlvoE1/A7e9Sb4mptTi1s8oEYtVfC3uvCyjARmE
 hD+npseq6KzSTJ6/ZBlIaFnau/wFK2rEHUwY9a9fQRXmBknpc3/qeS41uZFoWf58nHxI
 PDz/s9m5VhBE9weehBrOea+E9XFqLJCJ46x81Vnvo9gO11XhrJk1uION93rVIhiIhzcs
 bmRPKCYaC8l5SkPxfeEhXlwtCUEApRFRsq3O6qz0pDldpwNTJoPsYvZOyWPal+c4IWv1
 S0iL4piXvrfvaz6MpT1cf3zbgvGaQMAyHeG88UQfYHahGOBX8XL+Ymsu2QUXJcbQpg2r
 o/Hg==
X-Gm-Message-State: AGi0PuaOqC83p/9nuBHyZZibY8I6zY5tNS7UaIpKwSaGh83pOiJolZLn
 l9A6elQb2y7Tp6xBCx1MLqc=
X-Google-Smtp-Source: APiQypKxOKKezC9LSqoQNMq8pfb8WqigTi3QpWP4cDtN8ORzmT+N6Q29QlwObpPI/KIj1eBTghBmQg==
X-Received: by 2002:a62:6186:: with SMTP id
 v128mr24091199pfb.185.1589355005643; 
 Wed, 13 May 2020 00:30:05 -0700 (PDT)
Received: from localhost.localdomain ([1.38.219.254])
 by smtp.gmail.com with ESMTPSA id n9sm14852828pjt.29.2020.05.13.00.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 00:30:05 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed, 13 May 2020 12:59:49 +0530
Message-Id: <20200513072951.3453-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] parsing_cocci: Fix struct
	pointer funcall regression
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

This series is a fix in response to the following bug report:

https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07332.html

The following commit:

	c280375635f62dfbe052709e4e47a82140d32ce5

Introduces a regression in the following SmPL use case:

	@@
	struct s *x;
	@@

	x->func();

Where x is a pointer to a struct and func is a function belonging to
said struct. The faulty commit mislabels func as a function prototype
due to a missing case in the function-prototype-detection match ladder.

Enclosed in this patch series is a fix for this and a corresponding test
case.

Jaskaran Singh (2):
      parsing_cocci: parse_cocci: Fix struct pointer funcall regression
      tests: Add test case for struct pointer function call

 parsing_cocci/parse_cocci.ml |    1 +
 tests/structptr_func.c       |    5 +++++
 tests/structptr_func.cocci   |   12 ++++++++++++
 tests/structptr_func.res     |    6 ++++++
 4 files changed, 24 insertions(+)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
