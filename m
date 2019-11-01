Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0B1CA9ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 19:40:03 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04ED21897
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 19:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cgqvBPdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04ED21897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 78094FE5;
	Fri,  1 Nov 2019 19:40:03 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3DB20FE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 19:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7D3AF466
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 19:39:59 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id m5so474121ilq.0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 01 Nov 2019 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=U4SFXPgB1wZ8NTpCfbwAzZ5dPHiN0pbzPZ3aTF8PQeM=;
	b=cgqvBPdYucjzNwvQ8zLHNybF/mRiv7hnHEGODyA3Z4PuuiGIpqFHTA/whyk4m7HuGV
	LvEbTIKAZNLjTJjfK9dADkhqaucFTagZ6iypsjtxA17cIxXuLYf4cdTBOmK9BoAtxLzV
	vd1g32Af//FXB3ewa5cM5eJz8rogzUN7TkJRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=U4SFXPgB1wZ8NTpCfbwAzZ5dPHiN0pbzPZ3aTF8PQeM=;
	b=krj24o8mD09t4qzary2F1Iy2M485aXF02GXucE0BEG5i68R6kOfD6y4vCE95IMOUED
	EjKnBDVeK05aUtPaiN3F29jIHbFPUoATKKHo4MTcjVErd/T1fQNQkpFlJlcSDvbBDw4/
	Fy4tNNwKORmeJtzxWNVqfBdCFi7bTK8EoZcYdZVB5CSAV5sNZwfShbPwIWshVUIphxLE
	BZEulAD3UyOIot7ILEwoulij6uSAjU90tdZ4WBJFZa4rPOr9q1Y95sn3qUZQCwplwZTL
	kHOr429lpHHQ6cPVtTQPW45hVkNQSpNLtc0rHSidYL/Pwdirh7I6WvK7oR0Exi1DAFvI
	cjSw==
X-Gm-Message-State: APjAAAXY3nSPbH/Xg92bA3G2rf+dJRXoMSFM2vtj3S3fxDjadzu3RxiS
	GE4NY7jDDOi/pJw3kQhuam6qFWkP
X-Google-Smtp-Source: APXvYqy5KJ01tWcdlmX8IYHERuw41Tpul6kOKi9xI0H2E74oHx/jkcvA9DXYJLxMUyKy6zrTIdfvEw==
X-Received: by 2002:a92:35dd:: with SMTP id c90mr13448864ilf.191.1572637198664;
	Fri, 01 Nov 2019 12:39:58 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
	[24.9.64.241])
	by smtp.gmail.com with ESMTPSA id w6sm824189ioa.36.2019.11.01.12.39.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 12:39:58 -0700 (PDT)
To: linux-kernel-mentees@lists.linuxfoundation.org,
	Jaskaran <jaskaransingh7654321@gmail.com>,
	Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a7628457-c105-e631-585b-512cad30aeca@linuxfoundation.org>
Date: Fri, 1 Nov 2019 13:39:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] Documentation task list
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101193957.-IuqVrfvwWNI1VAIbj5sFwLPm07Na9m9Ery_ayEJ8Fk@z>

Hi Jaskara, Madhuparna and others applying for Spring:

When you pick doc warn task from the task list, please verify if it is
still a problem first. You can do that by building docs.

Also check linux-doc and linux-next trees to see of the problem exists.

Also, try to review and test each others patches. When you review and
test, send Tested-by.

Any questions, ask on IRC or send response to this email, so others
can benefit from the questions you ask me.

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
