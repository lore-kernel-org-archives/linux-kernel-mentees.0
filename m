Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B93DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:49:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA81F206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBEVva5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA81F206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A137B88376;
	Fri,  5 Jun 2020 13:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5oFa4XJgv0b; Fri,  5 Jun 2020 13:49:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03E778836D;
	Fri,  5 Jun 2020 13:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBF01C0888;
	Fri,  5 Jun 2020 13:49:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3ACC6C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3310488372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhJ895w0p3qe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 76AB88836D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:49:01 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id i12so2612861pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=cAN1aXwy651qLNYYl6ffgPV96B8aimkpwNpCz8u1hEY=;
 b=iBEVva5aGpFerUty12VGTRBcrb9YJ2g7ERMyPBS7JACdhKHNqB+KxJeXmr/kByZ+Vg
 sBou00l1MnJnsQLwE+bLXchN9HExbBfSSmGHLKnJOH+OaAIaGDLlyXGT1slC8PvfoZMS
 DdrMTItg4UOQerrEY0o+0+7dvb9Qko1yaRuVIhTfejdMdUsFWun3Biog12pnGZaBbl8H
 lREcgl8rkWm2B/mMtlTsBmO4qeo8dWCPzDmFLXu11TRfjVHKuSeGaeaw3m0Ca8IorFYO
 fcPdRcuZuzFEx+/0TSQwwtg96+Bn3vlVnT7Pqdp6roT5Z68IOcn613N1PAEwMAI7KJaU
 waTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=cAN1aXwy651qLNYYl6ffgPV96B8aimkpwNpCz8u1hEY=;
 b=auQtiD5CTPlQsp4ms19YLIy3fqrrbqzHvK21i8FYnMab0Wt5571lvf4CxRqBabt2gV
 xe+TwK/puJdhsZG//+rau+eOkB9W6mK7uOdsLFbN6ekdgo9LfrUVdLfOsJtRK6KAjL67
 22iG1281yf1zr9OC19watcxlYhaFigVSM5ARFBmErdEikdyjlMRzULNmfcu0mE7mlyUI
 afd9nDM87mbMaMWn5OlnBO157mmyU4/UQqFXp4WuaedF6YlZmAMo7+XqUSk3pqB8sJHx
 LYte85ViITCfI8zJzwU3Frnu286HOnXByehCW7v4DxMlZrsEVWrPUSPJoYZlfIu7cpQe
 3Puw==
X-Gm-Message-State: AOAM531qcpJL8SapLJ7zW+ey96UrQfc9atG7AMsKzxgPfXKynCXUpBiq
 m6emk1IH4VBk5wpjQT8zfKQ=
X-Google-Smtp-Source: ABdhPJzGiSyrAkjqOyltbryBhn5PUooFTgtFj11FBO21el51ZDMs0+doKGzdGQMlhISZP5sDszEPUw==
X-Received: by 2002:a17:90a:ec08:: with SMTP id
 l8mr3087690pjy.46.1591364940854; 
 Fri, 05 Jun 2020 06:49:00 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id gd1sm7799013pjb.14.2020.06.05.06.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:48:59 -0700 (PDT)
Message-ID: <135dd234af73db1048254c5714e00ea1aa9ad5e1.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 05 Jun 2020 19:18:52 +0530
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jas K <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4 00/14] cocci: Improve C
	parsing of attributes
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

On Fri, 2020-06-05 at 19:13 +0530, Jaskaran Singh wrote:
> This patch series aims to improve parsing of attributes in C by
> Coccinelle's C parser.
> 
> These parsing errors were discovered by running a build of
> Coccinelle's
> master branch on gitlab to parse the source code of Linux v5.5-rc4
> and Linux
> v5.6-rc7. Coccinelle currently manages attributes similar to
> comments, so
> to explicity state what the attributes are to the C parser, a
> MACROANNOTATION hint was used in Coccinelle's standard.h file. The
> hint
> enables the parser to correctly identify attributes, and thus
> potentially
> handle them differently in the AST.
> 
> Upon collection of these parsing errors, The GNU C Compiler's
> grammar was taken as a reference for introducing attributes in
> correct
> places in Coccinelle's C parser.
> 
> Upon applying the MACROANNOTATION hint to a majority of the
> attributes in
> Coccinelle's standard.h file and parsing the source code of Linux
> v5.6-rc7, the difference between the stats (of --parse-c) before and
> after applying this patch series are as follows:
> 
> Before:
> 
>         NB total files = 28268; perfect = 25697; pbs = 2570; timeout
> = 0; =========> 90%
>         nb good = 19160664,  nb passed = 135235 =========> 0.70%
> passed
>         nb good = 19160664,  nb bad = 129685 =========> 99.33% good
> or passed
> 
> After:
> 
>         NB total files = 28268; perfect = 25699; pbs = 2568; timeout
> = 0; =========> 90%
>         nb good = 19160856,  nb passed = 71716 =========> 0.37%
> passed
>         nb good = 19160856,  nb bad = 129493 =========> 99.33% good
> or passed
> 
> What this patch series does not do:
> - Add attributes from all the new productions into the C AST. Some of
>   these are dropped.
> - Reflect changes from the C parser in the SmPL parser.
> 
> Separate patches will be sent for the above.
> 
> 
> Changes in v4:
> -------------
> Remove the following patches from the series and add/merge them to
> [1].
> 	parsing_c: visitor_c: Add vk_attribute and vk_attribute_s
> 	parsing_c: lib_parsing_c: Add ii_of_attr
> 	engine: Add distrf_attr to PARAM functor
> 	engine: cocci_vs_c: Add allminus argument to attribute_list
> 	parsing_c: parser: Make abstract_declarator pass attributes
> 	cocci: Add parameter attributes to C AST
> 	parsing_c: parser: Place parameter attributes in C AST
> 	parsing_c: visitor_c: Visit parameter attributes
> 	parsing_c: unparse_hrule: Add parameter attributes in record
> 	parsing_c: type_c: Add parameter attributes to record
> 	engine: cocci_vs_c: "Match" parameter attributes
> 	engine: c_vs_c: Match parameter attributes
> 
> parsing_c: parser: Add rule for optional end attributes
> - Add to series.
> 
> parsing_c: parser: Add field declaration end attributes production
> - Use end_attributes_opt to avoid duplicate code.
> 
> parsing_c: parser: Handle struct/union/enum end attributes
> - Use end_attributes_opt to avoid duplicate code.
> 
> parsing_c: parser: Add MacroDecl end attributes production
> - Use end_attributes_opt to avoid duplicate code.
> 
> parsing_c: parser: cpp_other end attributes production
> - Use end_attributes_opt to avoid duplicate code.
> 
> 
> Changes in v3:
> -------------
> parsing_c: parser: Place parameter attributes in C AST
> - Remove the "attr is ignored" comments in the declaratorp rule.
> - Place the attributes from the "declarator attributes" production
>   in the declaratorp rule in the C AST as well.
> 
> 
> Changes in v2:
> --------------
> parsing_c: parser: Add attribute production in spec_qualif_list
> - This patch applied on its own causes a build error. Fix the error
> by
>   removing the let binding for abstract_declaratort in the type_name
>   rule
> 
> parsing_c: parser: Make abstract_declarator pass attributes
> - Reflect changes from the above build error fix.
> 

[1]
[PATCH v3 00/23] cocci: Add parameter attributes to SmPL
https://lore.kernel.org/cocci/20200511101300.11101-1-jaskaransingh7654321@gmail.com/


> 
> Jaskaran Singh (14):
>       parsing_c: parse_c: Ignore TMacroAttr and TMacroEndAttr in
> passed tokens
>       parsing_c: parsing_hacks: Label end attributes correctly
>       parsing_c: parsing_hacks: Commentize attributes before
> qualif/type
>       parsing_c: parser: Add rule for multiple end attributes
>       parsing_c: parser: Add expression statement attributes
>       parsing_c: parser: Add rule for optional end attributes
>       parsing_c: parser: Add attribute production in spec_qualif_list
>       parsing_c: parser: Add init_declarator_attrs rule
>       parsing_c: parser: Add field declaration end attributes
> production
>       parsing_c: parser: Handle struct/union/enum end attributes
>       parsing_c: parser: Add MacroDecl end attributes production
>       parsing_c: parser: cpp_other end attributes production
>       parsing_c: cpp_token_c: Introduce MACROANNOTATION hint
>       cocci: standard.h: Annotate attributes with MACROANNOTATION
> 
>  parsing_c/cpp_token_c.ml   |    2 
>  parsing_c/parse_c.ml       |    4 +
>  parsing_c/parser_c.mly     |   91 ++++++++++++++++++++++++--------
> ---
>  parsing_c/parsing_hacks.ml |   37 ++++++++++++++
>  standard.h                 |  116 ++++++++++++++++++++++----------
> -------------
>  5 files changed, 164 insertions(+), 86 deletions(-)
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
