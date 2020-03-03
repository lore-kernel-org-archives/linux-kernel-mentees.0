Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A60DC3F2C6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B8820873
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6sbGcJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B8820873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1261583FA2;
	Tue,  3 Mar 2020 05:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQ9CTTBhuYwi; Tue,  3 Mar 2020 05:03:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A27EA853C5;
	Tue,  3 Mar 2020 05:03:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C77CC07FE;
	Tue,  3 Mar 2020 05:03:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC716C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C87DC849A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKiplg3RS5Bs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 536D184989
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:22 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o5so778651pjs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 21:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eLgz00wfdz9N0jvVCBeUH0wvQLTL+dDy54Z23PzWjAU=;
 b=J6sbGcJlfAGXRutK7hZv/Mk/v2DyZ6unEYLjumIlqSIkE2h27P6IfV0sRkiczbl/tJ
 X5f7xvOlJ56tt3yZktu/vcsGbLIGMFm/NfN479MW9MtWTHcMTNO8GM7vt6oIW1o/Lgow
 TkVo8iYEVq36ADO3nihuNYhMZbDbCed8NvrbUK4yG10g5xg+C3GiX8zv+0SnYzBUn803
 yiY7mbjoVSvg7ds8YzudFE+ilA7nBlVHgbycUxIRWUxH3zSX86Tui9Uve4ONDtljhQk/
 OWXIoxjcLi3F1a0Oc19uHoAh4mWeodHPj7Tpcn/5FZjX3vgeFzW2VcFdQCQEYGtSSats
 kPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eLgz00wfdz9N0jvVCBeUH0wvQLTL+dDy54Z23PzWjAU=;
 b=U+1C/w6tU1z16tqEY5d7tflKvTLQWOo5qchXGrGFKsEZQeclKRyp33pgXKlikwW4vf
 KSYe7tpSVF1JxKV3aBOpK2qoDIhWDM9g5bSnYKOa1zGAtnQufKxms1WYICQVB1Y9AUTa
 fa5jvy/eeGz0qt0QwJTar3Ar0DRIZ5pNVqS6s/PqZ/bgnlQAjAKdK6To7r6ogheuVsWp
 0cPXCb4dmNg28KRj+kNIvfVwI7JfPF+lxii+DLKjtGqX05r664OmGTAgjDyHifWWpQ4D
 Gs4n8bnioCS4htPHkUqCYOXN5iY1ict9a5NZxNxPObE7yMz1IZmHCcz6l3LZMqqsS7KV
 oecg==
X-Gm-Message-State: ANhLgQ2KWPDusXsPYLLnZqu030Gc51LqZBmvK2Y4yhbS7mRBinKqZoUY
 8/QFA+qmCV+IIOXCIx/0Zws=
X-Google-Smtp-Source: ADFU+vs6JQW1Tol+V82s/wT5nWDEySTRxteYJJRYxDhajzZzXu1gPbrUcHkR7StH22DlyZnrd8IxdQ==
X-Received: by 2002:a17:90a:20b:: with SMTP id
 c11mr2127397pjc.53.1583211801855; 
 Mon, 02 Mar 2020 21:03:21 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c8aa:e481:f8d3:6de2:77f9:5602])
 by smtp.gmail.com with ESMTPSA id b2sm780446pjc.40.2020.03.02.21.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 21:03:21 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 10:32:59 +0530
Message-Id: <20200303050301.5412-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302114300.34875f69@lwn.net>
References: <20200302114300.34875f69@lwn.net>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 0/2] Documentation: Rename two txt
	files to rst
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patchset renames following two txt files to rst files and moves
them to driver-api manual from top level.
 -io-mapping.txt (Documentation/) -> io-mapping.rst(Documentation/driver-api/)
 -io_ordering.txt(Documentation/) -> io_ordering.rst(Documentation/driver-api/)

v2:
 -Provide more descriptive subject lines.
 -Move newly generated(rather renamed) rst files to driver-api manual
  from top level documentation.
v3:
 -In v2, the old files were left in place creating new rst files.
 -Rename the target files rather than simply creating new files.


Pragat Pandya (2):
  Documentation: Add io-mapping.rst to driver-api manual
  Documentation: Add io_ordering.rst to driver-api manual

 Documentation/driver-api/index.rst                            | 2 ++
 Documentation/{io-mapping.txt => driver-api/io-mapping.rst}   | 0
 Documentation/{io_ordering.txt => driver-api/io_ordering.rst} | 0
 3 files changed, 2 insertions(+)
 rename Documentation/{io-mapping.txt => driver-api/io-mapping.rst} (100%)
 rename Documentation/{io_ordering.txt => driver-api/io_ordering.rst} (100%)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
