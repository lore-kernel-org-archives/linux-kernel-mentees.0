Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8229DEE14D3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Sep 2023 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35CE682183;
	Wed,  6 Sep 2023 19:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CE682183
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=FX7O3unc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu71D8_mvHVw; Wed,  6 Sep 2023 19:54:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3318581467;
	Wed,  6 Sep 2023 19:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3318581467
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC7DC0039;
	Wed,  6 Sep 2023 19:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCE17C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 835EE81324
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 19:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 835EE81324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvGb84bg3l6K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 19:54:00 +0000 (UTC)
X-Greylist: delayed 902 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 Sep 2023 19:54:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B98812E8
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81B98812E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 19:54:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1694029136; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PJfwPFdVFUlg5NWtUwQdl1pEEkJZhTbWUVjHBsSSFQ03dtn7QBHZDOPiUdMXMw0L8FIcxf0sjK0y16CbGCee2/p5wcWbrIItgvPEN64zRnhaoVHTz+7PuPIsgOkASA4wqRb1cGWZKksTHcuPd1Lip3dSuS5RV4ldpLMhoc7+nYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1694029136;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=I/O+qnmPSlsxaxzK+RbhkLwsRQccX+4k6jRn9bcKeJM=; 
 b=JoxyPZ+gHLz6SQEYhCeZPya/9TZ9jviopk3Z60ulaKrs6uSCRPTIdRI0zrwoiWy5rUcHRih+8pw4ggDFnMPJ69XyBwU1WRc6YBjTwx/Nc1X8yUAJ/cRSFiJOOzkbzfKTSbxHTWqImX7MlK70wybA3dGdeCrkdeRy+qZbNmdBCGo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694029136; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
 bh=I/O+qnmPSlsxaxzK+RbhkLwsRQccX+4k6jRn9bcKeJM=;
 b=FX7O3unctRNazjOf2vUGmH9A2EIjyeOjWKklyZ3C6+cCqxIJM4b3pi5ei61yAycA
 voLxxumfZfKrvHJ52sW0KspCPfM+VhGwWC+KtMZgIGdLjlAqR6cCFTeepUl43D/zkke
 963O8zDVZiN8+emHab5yQwh7dEGYz28skP13IXUk=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 16940291344131011.4587540922197;
 Wed, 6 Sep 2023 12:38:54 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:39:22 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC] A simple workflow to work with syzbot bugs
Message-ID: <20230906193922.nqmrdvqd4otbqls2@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
X-ZohoMailClient: External
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

Hello mentors and mentees,

I just posted a mini guide on the basics of investigating bugs reported
by syzbot:
https://marliere.net/~ricardo/2023/09/06/simple-workflow.html

This is the way I'm gonna be working and it would be very good to
receive comments from you all to compare notes and also improve the
workflow!

Thanks,
-	Ricardo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
