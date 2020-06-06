Return-Path: <SRS0=FkPF=7T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4794CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Jun 2020 14:01:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB45206A2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Jun 2020 14:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB45206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB4A9880C0;
	Sat,  6 Jun 2020 14:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLEomQHCP71O; Sat,  6 Jun 2020 14:01:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC3218805D;
	Sat,  6 Jun 2020 14:01:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E09CC088D;
	Sat,  6 Jun 2020 14:01:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 066B3C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 14:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFA9987610
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 14:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnVOlLDthg0g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 14:01:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C0B4487593
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 14:01:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,480,1583190000"; d="scan'208";a="350774215"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2020 16:01:44 +0200
Date: Sat, 6 Jun 2020 16:01:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200606135342.12584-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2006061601340.10333@hadrien>
References: <20200529120703.31145-24-jaskaransingh7654321@gmail.com>
 <20200606135342.12584-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v4 23/32] parsing_c:
 type_annoter_c: Reflect Cast attributes
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



On Sat, 6 Jun 2020, Jaskaran Singh wrote:

> Cast attributes are added to the SmPL AST. Reflect these changes in
> type_annoter_c.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
> Changes in v4:
> - Change 't, e, a' to 't, a, e' in the Cast constructor for
>   consistency

Thanks!

julia

>
> Changes in v3:
> Rebase as follows:
>         v3 of "cocci: Add Parameter attributes to SmPL"[2]
>         v3 of "cocci: Improve C parsing of attributes"[3]
>         gitlab master branch (ffb87d9d)
>
> Changes in v2:
> parsing_c: parser: Pass attribute list from type_name
> - Warn about dropped attributes in typeof and sizeof productions
>
> parsing_cocci: parser: Parse cast attributes
> - Mention in commit message that cast attributes are matched anywhere
>   in a cast.
>
> parsing_cocci: arity: Reflect Cast attributes
> - Apply mcode2arity on attributes as well.
>
> parsing_cocci: visitor_ast: Visit cast attributes
> - Typo in commit message (AST0 -> AST).
>
> parsing_c: pretty_print_c: Reflect Cast attributes
> - Less space in front of [
>
> parsing_c: ast_c: Add Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: parser: Parse Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: pretty_print_c: Reflect Cast attributes
> - Switch places of expression and attributes in Cast type.
> - Change printing order of cast elements.
>
> parsing_c: type_annoter_c: Reflect Cast attributes
> - Switch places of expression and attributes in Cast type.
>
> parsing_c: visitor_c: Visit Cast attributes
> - Switch places of expression and attributes in Cast type.
> - Change visitor order of cast elements.
>
> engine: cocci_vs_c: Match Cast attributes
> - Switch places of expression and attributes in C AST Cast type.
>
> ocaml: coccilib: Reflect Cast attributes
> - Switch places of expression and attributes in C AST Cast type.
>
>
>  parsing_c/type_annoter_c.ml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/parsing_c/type_annoter_c.ml b/parsing_c/type_annoter_c.ml
> index dfd363b2..25cb6c0e 100644
> --- a/parsing_c/type_annoter_c.ml
> +++ b/parsing_c/type_annoter_c.ml
> @@ -525,7 +525,7 @@ let rec is_simple_expr expr =
>        true
>    | Binary (e1, op, e2) ->
>        true
> -  | Cast (t, e) ->
> +  | Cast (t, a, e) ->
>        true
>    | ParenExpr (e) -> is_simple_expr e
>
> @@ -961,7 +961,7 @@ let annotater_expr_visitor_subpart = (fun (k,bigf) expr ->
>
>
>      (* -------------------------------------------------- *)
> -    | Cast (t, e) ->
> +    | Cast (t, a, e) ->
>          k expr;
>          (* todo: if infer, can "push" info ? add_types_expr [t] e ? *)
>          make_info_def_fix (Lib.al_type t)
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
