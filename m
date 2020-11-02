Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4848AC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 12:57:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A50320897
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 12:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hec43PCm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A50320897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 098858670B;
	Mon,  9 Nov 2020 12:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjZX4MAFtdD6; Mon,  9 Nov 2020 12:57:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C735865E2;
	Mon,  9 Nov 2020 12:57:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BE42C088B;
	Mon,  9 Nov 2020 12:57:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16A4CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B58B2204A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85yx4kwDiXxL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by silver.osuosl.org (Postfix) with ESMTPS id 10B202000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:39:14 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 9so15253568oir.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=hec43PCm1XHAOuxWpcJq5zU0ooCj6552ZWyyoWsAm2lQXrJY3yNrWPXMK0O9UNfgZf
 5IoUwGcpiANqdPFcAvzXMzZZ4pdC2Hd1sS1/yvOXIIPcYccrlArvBc0flveGoynEzQv7
 n8ebdmOOAvQYEk87ub7MKx6SGvzIC7bx0nq0KPm8KPL3KFT+26v32vFgu1hIRMd1IbFT
 wF0YOZsydBQ/pv55aZbX1RDQDTAz0SUj7xh881Zt1sHCkkHuWcSESY4cO7KY2vedsbMD
 HkxGTTQKW4VVoGJQKrbKSkqXtw6k77ui2ruGzxgWL7XEdlhEMa2Cy6V43aWAcBpLMOzu
 9fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=sVv4PxcHDVw6TfmI5v7gpoyCEPG2mi0W9ECgZiifU7m4aLpvPSZuG+D6g5Ycvgq58E
 0AhSfC1F+S5cwhQmjJTDv5f8+zSEn+nNpSxeQV79uN2AXHQiwRkMTZtDd6XVxAbY+/c/
 UpSRbZEP1UupKD6rRppLsxNRE6c8fx4BsFXUum7DY7kV7O64s1wjfesVchiOsa5lf/YT
 w4esm4cmhG6/6CxvNUJSu8FY47TSB0W1VlpVo6MFdQZrd67uw0aAFczY2RXJK33faJ+F
 OT7Wng8hepjdBaxN8pxhBWuQd56rByDCA3fGH2Eb0tRtl96HhVI4ksGIwOnRvMULgsDQ
 7w9Q==
X-Gm-Message-State: AOAM531KPrLqKTZLgRFMsIOdsheWu0Czm4NOxFNMIh5jQV/+H8IC1pAM
 +z6vIq8wBPOlBu/1udYFXdThxofR1UhC8LQGOjSco+/z
X-Google-Smtp-Source: ABdhPJzjqVkFvCc2qHw9FSH6KtdLrDMCw/yYUaHhvg6LPh9xESnlrYWHid8VksBx/pq+grVemvRWxGQAHdTBexKKd9Q=
X-Received: by 2002:aca:4fc5:: with SMTP id
 d188mr10830751oib.143.1604335153010; 
 Mon, 02 Nov 2020 08:39:13 -0800 (PST)
MIME-Version: 1.0
From: Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date: Mon, 2 Nov 2020 22:08:55 +0530
Message-ID: <CAPRy4h0RAUZNqZF7q7pwYxWnYDWAYqkLyg+vFRsPhMqzZyANuQ@mail.gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Approved-At: Mon, 09 Nov 2020 12:57:20 +0000
Subject: [Linux-kernel-mentees] Unsubscribe me
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


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
