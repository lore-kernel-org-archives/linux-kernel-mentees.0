Return-Path: <SRS0=aW4b=J7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1CBC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 May 2021 20:24:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2D461059
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 May 2021 20:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2D461059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B8E418C6;
	Tue,  4 May 2021 20:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vpJbvfkGWP2; Tue,  4 May 2021 20:24:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A908E40398;
	Tue,  4 May 2021 20:24:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85A11C000E;
	Tue,  4 May 2021 20:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAA56C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 20:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE946418A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 20:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2X6Mmwc0NnZ1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 20:24:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA5C940398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 20:24:27 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u20so12762373lja.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 May 2021 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ljOaFx5sxl0lJ+8Y24M0tcDCWB8Uff0XK6FZa3bJW2I=;
 b=oJvSTfir7nwt9yh5x1uSwLc8K8nV18I8BYLxMGlSV+rtDsxHi/wQbyY+ulsVmQokQw
 ViEjLfL6+Xc5n6pSZ56bVrQlgHfmDWskEwXkyJQIwhvLTz4BP+jpypPzydiUYxUx8d1k
 KFlbtFp3ZrE6FIreDOEwTe0yVl+LpL7N2hWaXdh52pFxqtyHYQumqJN8x/Y7Nim3NtqF
 DFbG7d568mVnIYrqoQyrydGWA9oBYW5J1EKhzM7ukIoPKNBiJ+1T5zFWfpOzxKyZkHPs
 J9nYtac/N86NvUOaVlL+9ikRNULOrV2Qt3lj3rI4fdpbpqjvJIOPagP9a7ppU6xspOPe
 0NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ljOaFx5sxl0lJ+8Y24M0tcDCWB8Uff0XK6FZa3bJW2I=;
 b=ilFv/fD2OjRAKrXYeG7e8wAoE53XWatG28Gcnvr83ydHOiV8ghsP993E2z+XR6bWhO
 MiAkCp6kboPawhkpubdnInpp8z3XLHoj2KNmPLtpY4EsleA112r3iM/pyC091bSBswTs
 OP73MZF2lHc812CDih4of2j7aTt1jWqc3zQrqum2vNPXzpOkOuVuqxRzjIZMyjuwqSSN
 v49YWx0kpbIia03RAjVlCN0Ri88f6J3S4vnSLmhSa5L0Xs11kqR4ZgxFStdNhv+JVETv
 Q/0LMXS49Iiwpd+G6GZiuHt/2fw0B4Z5aShhEmBliW/obY7vJhV5tBpfW6DFmXOdsYb4
 B8Vw==
X-Gm-Message-State: AOAM531/q2E9mjijBMILA2Kux/vWTUjwjkfKFgllzMcAocEyJPMjqbhr
 n9fNZXn4fWBCnaeJqTrr5IjHaUefU0ZC28ClVItZPQE4dEqncQ==
X-Google-Smtp-Source: ABdhPJzUFbv8SwNo2e891cbLi/GZzVLv3iXvC3mlIpvH8SZUwm+snLhO9AnAMH3QcIFRWXWy3WuYQv9bmowS7k4io68=
X-Received: by 2002:a2e:581a:: with SMTP id m26mr10211287ljb.493.1620159865386; 
 Tue, 04 May 2021 13:24:25 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Eduardo Climaco Barbosa <barbosa.carlos.ec@gmail.com>
Date: Tue, 4 May 2021 17:24:25 -0300
Message-ID: <CALBj8qfcCj8BA4VtoKmdnumGV4sHg99tccZuFV0fArBns-Eskg@mail.gmail.com>
Subject: [Bug Fixing] Interest in Mentorship - Summer 2021: Carlos Barbosa
To: linux-kernel-mentees@lists.linuxfoundation.org
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

Hi Shuah and Greg,

This is Carlos Barbosa. I am interested in the Bug Fixing mentorship.
Is it still in time for the Summer Term application? If so, how should
I proceed? (i.e. what evaluation tasks should I do?)
I have already started tracking a PCI driver bug I have in my machine,
but I'm afraid it could be too big a task to do in due time.

I soon intend to officially apply through the LFX site, but I must
update my CV first.

Thank you,

Carlos Barbosa
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
