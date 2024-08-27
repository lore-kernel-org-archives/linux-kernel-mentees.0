Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599621CDFC4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724777579; cv=none; b=ZZ9KAjHTTYbl+OtTkYcT9PrBnMd0Jth475QKV2JQ7ApTaaQIvcQwEdCjipJktuC4W1pz+rOBLqceZ9t7csWoOztXVi2zutgCRtre8ISqcmZlUcGC5J1p92NXosXc7ErGGJrtPEXyGeTMDe9euAO744YXBbEe4Zud5VYXQLF3M4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724777579; c=relaxed/simple;
	bh=fbFu4tV7WKNsBzDksuuyxwl/QdiXcuuMStHtiLt1olY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m7I76ycV974jamDN4M1EPop4nReRVMVuNFihdv1FB6RHo04mxlLFPHrrSzHK808hSyqXnbUQlidyOUuCX6MODYNzSVUUBxNGDIFPHAZpFGYAxbNv5ydeSb+emXuwPK/5BMRoRCZa9XZm/0ToOTG9SxMm/cwTJOo1MS4J1R3ZxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2liWEyZ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2liWEyZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE764401E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 16:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixT80SpYj2Mg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Aug 2024 16:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0540C40131
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0540C40131
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d2liWEyZ
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0540C40131
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 16:52:56 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d3bae081efso4500841a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724777576; x=1725382376; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgufQIEOckAZWWO2W51+cL+ZYcIhyk1JdZ2OgFTRv3Y=;
        b=d2liWEyZlCSq6TBgyuo0w1UQKVWX2EN6urAE4juRHdrRevjSY8cUqz3WV4PhpwM7PA
         9rAcxJu0LwXIQQg46MBi3x+GRrlAkmoCNU4ppnqKu/zvm2wzfW9bTv9aL/eNeGOb13p8
         EWYUMslviKnzZHvEtRYbsM89jN+U666NlkFswYkKwmpXx56PcQDk/Rr6UwpUtGiTdATI
         cqhCd5T6asY9YaMP1smMooRLGW/J6PCy0EOCAWUEWR5getLarWsdJ6gKmsQeoZL/7JkG
         CPvjQAfdFUKKJjj4ajVWmttz5KjKOuaxI3QFyiMsxL7jh+mKAy7t9VuS7NBZOLaR9+kP
         ki+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724777576; x=1725382376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgufQIEOckAZWWO2W51+cL+ZYcIhyk1JdZ2OgFTRv3Y=;
        b=i/3VI1km54sEgQyRqpZNRDOX4FMHLq3Pni7YqyL+nU2ridrbhncwBgyQpu6IeGGy0H
         QD/SAY1HuXYEcmhra3SRwr44gdQNdbvvkbKcIXXspXhn5WFAYyflHmswgmON45OANC78
         eQiqAFFULAUl+hQuGmfmxzK+7+ztALicr/B0N/ucQzk9gRQjy1cS/X6t5wILZdMJ9glT
         SzXhfiv1zu5ZzdhjsghEq4UqfJEUbw57GZo0irPmy3dNueSDQnNN9/6oIbCZMoxcKxLF
         IpEyQrrwXMAmoJHAgLLRB7pa6fW5wUFPzxa07EZRBPFIvy1NJPbL7jYgi/AQHGeZ/SAw
         mbPQ==
X-Gm-Message-State: AOJu0YxRs29dr7GcAlBJ66oTaqtoE4dijtcvPq9Rt5OELxIAYSNQO317
	3rbv6fUXLosZ94d2JfleL/4DzjvQ1uO+j9AEpITBBpsyUGn66T4B
X-Google-Smtp-Source: AGHT+IEL4IxrVWd7WYCyCWbVkrBhxEhWWuzch3KnZ8hA9ZodiW+9hzqIj+K0j0RA3JErddA2hi0JHg==
X-Received: by 2002:a17:90a:5ac4:b0:2d4:6ef:cb14 with SMTP id 98e67ed59e1d1-2d646d386admr14347548a91.28.1724777575847;
        Tue, 27 Aug 2024 09:52:55 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613a6123fsm12333081a91.33.2024.08.27.09.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:52:55 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	abhishektamboli9@gmail.com
Subject: [PATCH] rtc: m48t59: Remove division condition with direct comparison
Date: Tue, 27 Aug 2024 22:21:31 +0530
Message-Id: <20240827165131.34592-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809155631.548044-1-abhishektamboli9@gmail.com>
References: <20240809155631.548044-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexandre,

I wanted to check if you had a chance to review the patch I sent to you [1]. 
I understand you may have a busy schedule, but I would appreciate 
any feedback you can provide when you have time.

The patch is available here:
[1]: https://lore.kernel.org/all/20240809155631.548044-1-abhishektamboli9@gmail.com/

Thank you for your time. 

Best regards,
Abhishek

